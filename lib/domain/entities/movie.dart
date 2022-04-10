class Movie {
  int id;
  bool adult;
  String overview;
  String originalTitle;
  String originalLanguage;
  String title;
  String? posterPath;
  double popularity;
  String releaseDate;

  Movie({
    required this.id,
    required this.adult,
    required this.overview,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    this.posterPath,
    required this.popularity,
    required this.releaseDate,
  });
}
