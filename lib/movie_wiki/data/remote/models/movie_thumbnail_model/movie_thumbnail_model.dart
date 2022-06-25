import 'package:flutter_playground/movie_wiki/domain/entities/movie_thumbnail.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_thumbnail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class MovieThumbnailModel {
  final String title, year, type, poster;
  @JsonKey(name: 'imdbID')
  final String imdbID;

  MovieThumbnailModel(
      this.title, this.year, this.imdbID, this.type, this.poster);

  factory MovieThumbnailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieThumbnailModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieThumbnailModelToJson(this);
  MovieThumbnail toEntity() =>
      MovieThumbnail(imdbID, title, year, type, poster);
}
