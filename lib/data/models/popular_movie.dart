import 'package:json_annotation/json_annotation.dart';

part 'popular_movie.g.dart';

@JsonSerializable()
class PopularMovie {
  double popularity;
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: 'video')
  bool video;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'adult')
  bool adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'genre_ids')
  List<int> genreIds;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'overview')
  String overview;
  @JsonKey(name: 'release_date')
  String releaseDate;

  PopularMovie({
    required this.popularity,
    required this.voteCount,
    required this.video,
    this.posterPath,
    required this.id,
    required this.adult,
    this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.genreIds,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
  });

  factory PopularMovie.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMovieToJson(this);
}
