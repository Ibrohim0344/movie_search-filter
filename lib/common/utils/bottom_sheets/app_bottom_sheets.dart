import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:insoft_test_task/data/entities/filter_params.dart';

import '../../../common/style/colors.dart';
import '../../../common/constants/all_movies.dart';
import '../../../common/extensions/app_extensions.dart';
import '../../../features/widgets/selection_button.dart';

sealed class AppBottomSheets {
  static Future filter(BuildContext context, Size size) {
    List<bool> statusValues = List.filled(statuses.length, true);
    List<bool> genreValues = List.filled(genres.length, true);
    List<bool> yearsValues = List.filled(years.length, true);
    List<String> allStatuses = statuses;
    List<String> allGenres = genres;
    List<int> allYears = years.reversed.toList();
    // List<bool> filteredStatuses = List.filled(statuses.length, true);
    // List<bool> filteredGenres = List.filled(genres.length, true);
    // List<bool> filteredYears = List.filled(years.length, true);

    List<bool> onChanged({
      required StateSetter state,
      required bool value,
      required int index,
      required List<bool> values,
    }) {
      for (int i = 0; i < values.length; i++) {
        if (i == index) values[i] = value;
      }
      state(() {});
      return values;
    }

    return showModalBottomSheet(
      context: context,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      elevation: 4,
      useSafeArea: true,
      enableDrag: true,
      builder: (context) {
        return ColoredBox(
          color: Colors.black87,
          child: SizedBox(
            // height: size.height * 0.6,
            child: StatefulBuilder(builder: (context, StateSetter state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Filter",
                            style: context.textStyle.titleMedium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          8.height,
                          Text(
                            "Status",
                            style: context.textStyle.labelLarge?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          4.height,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Row(
                              children: List.generate(
                                allStatuses.length,
                                (index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: SelectionButton(
                                    text: allStatuses[index],
                                    value: statusValues[index],
                                    onChanged: (value) {
                                      statusValues = onChanged(
                                        state: state,
                                        value: value!,
                                        index: index,
                                        values: statusValues,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          8.height,
                          Text(
                            "Genres",
                            style: context.textStyle.labelLarge?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          4.height,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                allGenres.length,
                                (index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: SelectionButton(
                                    text: allGenres[index],
                                    value: genreValues[index],
                                    onChanged: (value) {
                                      genreValues = onChanged(
                                        state: state,
                                        value: value!,
                                        index: index,
                                        values: genreValues,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          8.height,
                          Text(
                            "Year",
                            style: context.textStyle.labelLarge?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          4.height,
                          SizedBox(
                            width: double.infinity,
                            child: Wrap(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              alignment: WrapAlignment.spaceBetween,
                              children: List.generate(
                                yearsValues.length,
                                (index) => SizedBox(
                                  width: size.width / 3 - 32,
                                  child: SelectionButton(
                                    text: allYears[index].toString(),
                                    value: yearsValues[index],
                                    onChanged: (value) {
                                      yearsValues = onChanged(
                                        state: state,
                                        value: value!,
                                        index: index,
                                        values: yearsValues,
                                      );
                                    },
                                    isBackgroundVisible: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          height: 70,
                          child: ColoredBox(color: Colors.blueGrey),
                        ),
                        Row(
                          children: [
                            16.width,
                            Expanded(
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                onPressed: () {
                                  yearsValues = yearsValues.reversed.toList();
                                  List<String> filteredStatuses = [];
                                  List<String> filteredGenres = [];
                                  List<int> filteredYears = [];
                                  for (int i = 0; i < statusValues.length; i++) {
                                    if (statusValues[i]) {
                                      filteredStatuses.add(statuses[i]);
                                    }
                                  }
                                  for (int i = 0; i < genreValues.length; i++) {
                                    if (genreValues[i]) {
                                      filteredGenres.add(genres[i]);
                                    }
                                  }
                                  for (int i = 0; i < yearsValues.length; i++) {
                                    if (yearsValues[i]) {
                                      filteredYears.add(years[i]);
                                    }
                                  }
                                  FilterParams acceptedFilter = FilterParams(
                                    statuses: filteredStatuses,
                                    genres: filteredGenres,
                                    years: filteredYears,
                                  );
                                  Navigator.of(context).pop(acceptedFilter);
                                },
                                child: Text(
                                  "Filter",
                                  style:
                                      context.textStyle.titleMedium?.copyWith(
                                    color: AppColors.silver,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                statusValues =
                                    List.filled(statusValues.length, true);
                                genreValues =
                                    List.filled(genreValues.length, true);
                                yearsValues =
                                    List.filled(yearsValues.length, true);
                                state(() {});
                              },
                              icon: const Icon(
                                Icons.refresh,
                                color: AppColors.silver,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
