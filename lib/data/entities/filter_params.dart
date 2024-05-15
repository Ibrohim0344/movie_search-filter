class FilterParams {
  final List<String> statuses;
  final List<String> genres;
  final List<int> years;

  const FilterParams({
    required this.statuses,
    required this.genres,
    required this.years,
  });
}
