class MovieEntity {
  final String name;
  final String image;
  final List<String> genre;
  final int year;
  final String status;

  const MovieEntity({
    required this.name,
    required this.image,
    required this.genre,
    required this.year,
    required this.status,
  });

  @override
  String toString() => """
  MovieEntity({
    name -> $name,
    image -> $image,
    genre -> $genre,
    year -> $year,
    status -> $status,
  });
  """;
}
