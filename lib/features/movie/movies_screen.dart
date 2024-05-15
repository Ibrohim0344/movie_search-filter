import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:insoft_test_task/common/utils/bottom_sheets/app_bottom_sheets.dart';
import 'package:insoft_test_task/data/entities/filter_params.dart';

import 'widgets/my_search_field.dart';
import '../../common/style/colors.dart';
import '../../data/entities/movie_entity.dart';
import '../../common/constants/all_movies.dart';
import '../../common/extensions/app_extensions.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  /// example ko'proq bo'lishi uchun
  List<MovieEntity> allMovies = [...movies, ...movies..shuffle()];
  List<MovieEntity> receivedMovies = [];
  List<String> allGenres = genres;
  List<bool> selectedFilter = List.filled(genres.length, false);
  bool isFiltering = false;
  bool isPaginationLoading = false;
  int page = 0;
  int count = 10;
  late final ScrollController scrollController;
  late final TextEditingController controller;
  FilterParams? filteredParams;

  @override
  void initState() {
    getMovies(page: page, limit: count);
    controller = TextEditingController();
    scrollController = ScrollController()..addListener(pagination);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(pagination);
    super.dispose();
  }

  void pagination() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (page * count < allMovies.length) {
        setState(() => isPaginationLoading = true);
        await Future.delayed(const Duration(seconds: 2));
        getMovies(page: page++);
      }
    }
    setState(() => isPaginationLoading = false);
  }

  void getMovies({required int page, int limit = 5}) {
    count = limit;
    List<MovieEntity> getRangeMovie = [];
    if (page * limit + limit < allMovies.length) {
      getRangeMovie =
          allMovies.getRange(page * limit, page * limit + limit).toList();
      receivedMovies = [...receivedMovies, ...getRangeMovie];
    } else if (page * limit < allMovies.length) {
      getRangeMovie =
          allMovies.getRange(page * limit, allMovies.length).toList();
      receivedMovies = [...receivedMovies, ...getRangeMovie];
    }
  }

  void separateGenre(String genre, int index) async {
    scrollController.removeListener(pagination);
    for (int i = 0; i < allGenres.length; i++) {
      i == index ? selectedFilter[i] = true : selectedFilter[i] = false;
    }
    setState(() => isFiltering = true);
    await Future.delayed(const Duration(milliseconds: 1200));

    receivedMovies = allMovies
        .where(
          (element) => element.genre.contains(genre),
        )
        .toList();
    setState(() => isFiltering = false);
  }

  Future<void> onRefresh() async =>
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const MoviesScreen(),
      ));

  void onSearch(String value) {
    controller.text.isNotEmpty
        ? scrollController.removeListener(pagination)
        : scrollController.addListener(pagination);
    receivedMovies = allMovies
        .where(
          (element) =>
              element.name.toLowerCase().startsWith(value.toLowerCase()),
        )
        .toList();
    setState(() {});
  }

  void filter(Size size) => AppBottomSheets.filter(context, size).then((value) {
        filteredParams = value as FilterParams?;
        if (filteredParams != null) {
          receivedMovies = movies.where((movie) {
            log("----------------------- movie - $movie");
            bool statuses = filteredParams!.statuses
                .any((status) => status == movie.status);
            bool genres =
                filteredParams!.genres.any((genre) => movie.genre.contains(genre));
            bool years =
                filteredParams!.years.any((year) => year == movie.year);
            log("----------------------- status - $statuses");
            log("----------------------- genre - $genres");
            log("----------------------- year - $years\n");
            bool isValid = statuses && genres && years;
            return isValid ? true : false;
          }).toList();
        }
        setState(() {});
      });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    log("============================= ${filteredParams?.statuses} =============================");
    log("============================= ${filteredParams?.genres} =============================");
    log("============================= ${filteredParams?.years} =============================");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.purple,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: MySearchField(
          controller: controller,
          onChanged: onSearch,
        ),
        actions: [
          IconButton(
            style: IconButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              fixedSize: const Size(50, 50),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () => filter(size),
            icon: const Icon(Icons.filter_alt_outlined),
          ),
          16.width,
        ],
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                allGenres.length,
                (i) => TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        selectedFilter[i] ? Colors.red : AppColors.silver,
                  ),
                  onPressed: () => separateGenre(allGenres[i], i),
                  child: Text(allGenres[i]),
                ),
              ),
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: isFiltering
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.silver,
                          strokeCap: StrokeCap.round,
                        ),
                      )
                    : GridView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: scrollController,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: size.width / 3,
                          childAspectRatio: 9 / 17,
                          crossAxisSpacing: size.width * .02,
                        ),
                        children: receivedMovies
                            .map(
                              (e) => Column(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      child: Image(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(e.image),
                                      ),
                                    ),
                                  ),
                                  4.height,
                                  Expanded(
                                    child: Text(
                                      "${e.year}: ${e.name}",
                                      overflow: TextOverflow.fade,
                                      style: context.textStyle.labelSmall
                                          ?.copyWith(
                                        color: AppColors.silver,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  8.height,
                                ],
                              ),
                            )
                            .toList(),
                      ),
              ),
              8.height,
              isPaginationLoading
                  ? const CircularProgressIndicator(
                      color: AppColors.silver,
                      strokeCap: StrokeCap.round,
                    )
                  : const SizedBox.shrink(),
              16.height,
            ],
          ),
        ),
      ),
    );
  }
}
