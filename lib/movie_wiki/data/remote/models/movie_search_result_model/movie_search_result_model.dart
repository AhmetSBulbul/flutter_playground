import 'package:flutter_playground/movie_wiki/data/remote/models/movie_thumbnail_model/movie_thumbnail_model.dart';
import 'package:flutter_playground/movie_wiki/domain/entities/movie_search_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_search_result_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class MovieSearchResultModel extends MovieSearchResult {
  final List<MovieThumbnailModel> search;
  @JsonKey(name: 'totalResults')
  final String totalResults;

  MovieSearchResultModel(this.search, this.totalResults)
      : super(search, totalResults);

  factory MovieSearchResultModel.fromJson(Map<String, dynamic> json) =>
      _$MovieSearchResultModelFromJson(json);

  toJson() => _$MovieSearchResultModelToJson(this);

  toEntity() =>
      MovieSearchResult(search.map((e) => e.toEntity()).toList(), totalResults);
}
