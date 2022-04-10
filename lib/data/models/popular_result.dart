import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/models/popular_movie.dart';

part 'popular_result.g.dart';

@JsonSerializable()
class PopularResult {
  int page;
  @JsonKey(name: 'total_results')
  int totalResults;
  @JsonKey(name: 'total_pages')
  int totalPages;
  List<PopularMovie> results;

  PopularResult({
    required this.page,
    required this.totalResults,
    required this.totalPages,
    required this.results,
  });
  factory PopularResult.fromJson(Map<String, dynamic> json) =>
      _$PopularResultFromJson(json);

  Map<String, dynamic> toJson() => _$PopularResultToJson(this);
}
