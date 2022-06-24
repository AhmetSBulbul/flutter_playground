import 'package:json_annotation/json_annotation.dart';
part 'movie_thumbnail_model.g.dart';

@JsonSerializable()
class MovieThumbnailModel {
  final String title, year, imdbID, type, poster;

  MovieThumbnailModel(
      this.title, this.year, this.imdbID, this.type, this.poster);

  factory MovieThumbnailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieThumbnailModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieThumbnailModelToJson(this);
}
