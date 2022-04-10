// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularResult _$PopularResultFromJson(Map<String, dynamic> json) =>
    PopularResult(
      page: json['page'] as int,
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => PopularMovie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PopularResultToJson(PopularResult instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.results,
    };
