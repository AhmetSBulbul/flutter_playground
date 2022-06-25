import 'package:json_annotation/json_annotation.dart';
part 'movie_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class MovieModel {
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

  MovieModel(this.title, this.year, this.rated, this.actors, this.poster,
      this.genre, this.director, this.metascore, this.country, this.language);

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
