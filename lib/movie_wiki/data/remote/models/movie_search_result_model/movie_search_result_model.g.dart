// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieSearchResultModel _$MovieSearchResultModelFromJson(
        Map<String, dynamic> json) =>
    MovieSearchResultModel(
      (json['Search'] as List<dynamic>)
          .map((e) => MovieThumbnailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['totalResults'] as int,
    );

Map<String, dynamic> _$MovieSearchResultModelToJson(
        MovieSearchResultModel instance) =>
    <String, dynamic>{
      'Search': instance.search,
      'totalResults': instance.totalResults,
    };
