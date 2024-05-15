import '../../data/entities/movie_entity.dart';

List<MovieEntity> movies = [
  const MovieEntity(
    name: "The Shawshank Redemption",
    image: "https://image.tmdb.org/t/p/w342/hhhYhZiubfKhl7RYd4BiDQabd55.jpg",
    genre: ["Drama"],
    year: 2016,
    status: "Free",
  ),
  const MovieEntity(
    name: "The Godfather",
    image:
        "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg",
    genre: ["Crime"],
    year: 2024,
    status: "Premium",
  ),
  const MovieEntity(
    name: "The Dark Knight",
    image:
        "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg",
    genre: ["Action"],
    year: 2020,
    status: "Premium",
  ),
  const MovieEntity(
    name: "The Lord of the Rings: The Fellowship of the Ring",
    image:
        "https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg",
    genre: ["Fantasy", "Adventure"],
    year: 2022,
    status: "Free",
  ),
  const MovieEntity(
    name: "Schindler's List",
    image:
        "https://m.media-amazon.com/images/M/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg",
    genre: ["Historical Drama"],
    year: 2018,
    status: "Premium",
  ),
  const MovieEntity(
    name: "The Princess Bride",
    image:
        "https://m.media-amazon.com/images/M/MV5BMjM0Nzk5NTc4OV5BMl5BanBnXkFtZTcwMDA2MzgxNA@@._V1_.jpg",
    genre: ["Comedy", "Adventure", "Fantasy"],
    year: 2017,
    status: "Premium",
  ),
  const MovieEntity(
    name: "Forrest Gump",
    image:
        "https://musicart.xboxlive.com/7/40025100-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080",
    genre: ["Drama", "Romance"],
    year: 2019,
    status: "Free",
  ),
  const MovieEntity(
    name: "Inception",
    image:
        "https://play-lh.googleusercontent.com/buKf27Hxendp3tLNpNtP3E-amP0o4yYV-SGKyS2u-Y3GdGRTyfNCIT5WAVs2OudOz6so5K1jtYdAUKI9nw8=w240-h480-rw",
    genre: ["Action", "Thriller", "Science Fiction"],
    year: 2023,
    status: "Free",
  ),
  const MovieEntity(
    name: "The Good, the Bad and the Ugly",
    image:
        "https://m.media-amazon.com/images/M/MV5BNjJlYmNkZGItM2NhYy00MjlmLTk5NmQtNjg1NmM2ODU4OTMwXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_.jpg",
    genre: ["Western"],
    year: 2024,
    status: "Free",
  ),
  const MovieEntity(
    name: "Fight Club",
    image:
        "https://m.media-amazon.com/images/M/MV5BMmEzNTkxYjQtZTc0MC00YTVjLTg5ZTEtZWMwOWVlYzY0NWIwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg",
    genre: ["Drama", "Thriller"],
    year: 2017,
    status: "Free",
  ),
  const MovieEntity(
    name: "Whiplash",
    image:
        "https://play-lh.googleusercontent.com/fCn_UmRfVvj-YSU0KRUQ3pztA3UDcZ3ClMwxifI7UJ-bFo7ToB5n_OxoGKmgMzuGNjBoHixs0b6yGA-jBvzz",
    genre: ["Drama", "Music"],
    year: 2016,
    status: "Free",
  ),
  const MovieEntity(
    name: "Good Will Hunting",
    image:
        "https://m.media-amazon.com/images/M/MV5BOTI0MzcxMTYtZDVkMy00NjY1LTgyMTYtZmUxN2M3NmQ2NWJhXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg",
    genre: ["Drama"],
    year: 2022,
    status: "Free",
  ),
  const MovieEntity(
    name: "Parasite",
    image:
        "https://m.media-amazon.com/images/M/MV5BYWZjMjk3ZTItODQ2ZC00NTY5LWE0ZDYtZTI3MjcwN2Q5NTVkXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_.jpg",
    genre: ["Thriller", "Black Comedy"],
    year: 2020,
    status: "Free",
  ),
  const MovieEntity(
    name: "12 Angry Men",
    image:
        "https://m.media-amazon.com/images/M/MV5BNDhjMjE4NDItZTkyOC00NjIwLWI0MDQtYTJhZjY2YzlkMDQ0XkEyXkFqcGdeQXVyMTA0MTM5NjI2._V1_.jpg",
    genre: ["Drama"],
    year: 2021,
    status: "Free",
  ),
  const MovieEntity(
    name: "Spirited Away",
    image:
        "https://m.media-amazon.com/images/M/MV5BMjlmZmI5MDctNDE2YS00YWE0LWE5ZWItZDBhYWQ0NTcxNWRhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg",
    genre: ["Animation", "Fantasy"],
    year: 2024,
    status: "Subscription",
  ),
  const MovieEntity(
    name: "The Big Lebowski",
    image:
        "https://m.media-amazon.com/images/I/71LW4PxX5xL._AC_UF894,1000_QL80_.jpg",
    genre: ["Comedy", "Crime"],
    year: 2021,
    status: "Free",
  ),
  const MovieEntity(
    name: "Memento",
    image:
        "https://m.media-amazon.com/images/M/MV5BZTcyNjk1MjgtOWI3Mi00YzQwLWI5MTktMzY4ZmI2NDAyNzYzXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg",
    genre: ["Mystery", "Neo-Noir"],
    year: 2018,
    status: "Subscription",
  ),
  const MovieEntity(
    name: "The Departed",
    image:
        "https://m.media-amazon.com/images/I/81WcW8oRM7L._AC_UF1000,1000_QL80_.jpg",
    genre: ["Crime", "Drama", "Thriller"],
    year: 2019,
    status: "Premium",
  ),
  const MovieEntity(
    name: "The Shining",
    image:
        "https://m.media-amazon.com/images/I/81nwnHTcV2L._AC_UF894,1000_QL80_.jpg",
    genre: ["Horror", "Psychological Thriller"],
    year: 2020,
    status: "Free",
  ),
  const MovieEntity(
    name: "Blade Runner 2049",
    image:
        "https://m.media-amazon.com/images/M/MV5BNzA1Njg4NzYxOV5BMl5BanBnXkFtZTgwODk5NjU3MzI@._V1_.jpg",
    genre: ["Science Fiction", "Neo-Noir"],
    year: 2016,
    status: "Free",
  ),
  const MovieEntity(
    name: "Interstellar",
    image:
        "https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg",
    genre: ["Science Fiction", "Adventure"],
    year: 2023,
    status: "Subscription",
  ),
  const MovieEntity(
    name: "The Grand Budapest Hotel",
    image:
        "https://m.media-amazon.com/images/M/MV5BMzM5NjUxOTEyMl5BMl5BanBnXkFtZTgwNjEyMDM0MDE@._V1_.jpg",
    genre: ["Comedy", "Crime"],
    year: 2023,
    status: "Free",
  ),
  const MovieEntity(
    name: "Kill Bill: Vol. 1",
    image:
        "https://m.media-amazon.com/images/M/MV5BNzM3NDFhYTAtYmU5Mi00NGRmLTljYjgtMDkyODQ4MjNkMGY2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg",
    genre: ["Action", "Crime"],
    year: 2024,
    status: "Subscription",
  ),
];

List<String> genres = [
  "Fantasy",
  "Comedy",
  "Adventure",
  "Action",
  "Crime",
  "Thriller",
  "Drama",
  "Psychological Thriller",
  "Horror",
  "Neo-Noir",
  "Mystery",
  "Animation",
  "Black Comedy",
  "Historical Drama",
  "Music",
  "Western",
  "Science Fiction",
  "Romance",
];

List<String> statuses = ["Free", "Subscription", "Premium"];

List<int> years = List.generate(9, (index) => index + 2016);
