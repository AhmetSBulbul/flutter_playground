import 'package:json_annotation/json_annotation.dart';
part 'movie_detailed_model.g.dart';

@JsonSerializable()
class MovieDetailedModel {
  final String title;
  final String year;
  final String rated;
  final String actors;
  final String poster;
  final String genre;
  final String director;
  final String metascore;
  final String country;
  final String language;

  MovieDetailedModel(
      this.title,
      this.year,
      this.rated,
      this.actors,
      this.poster,
      this.genre,
      this.director,
      this.metascore,
      this.country,
      this.language);

  factory MovieDetailedModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailedModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailedModelToJson(this);
}
