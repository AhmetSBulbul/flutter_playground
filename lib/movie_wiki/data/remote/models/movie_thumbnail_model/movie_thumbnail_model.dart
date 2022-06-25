import 'package:flutter_playground/movie_wiki/domain/entities/movie_thumbnail.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_thumbnail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class MovieThumbnailModel extends MovieThumbnail {
  final String title, year, type, poster;
  @JsonKey(name: 'imdbID')
  final String imdbId;

  MovieThumbnailModel(
      this.title, this.year, this.imdbId, this.type, this.poster)
      : super(title, year, imdbId, type, poster);

  factory MovieThumbnailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieThumbnailModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieThumbnailModelToJson(this);
  MovieThumbnail toEntity() =>
      MovieThumbnail(imdbId, title, year, type, poster);
}
