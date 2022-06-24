import 'package:hive/hive.dart';
part 'movie_detailed_local_model.g.dart';

@HiveType(typeId: 1)
class MovieDetailedLocalModel {
  @HiveField(0)
  final String imdbID;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String year;

  @HiveField(3)
  final String rated;

  @HiveField(4)
  final String actors;

  @HiveField(5)
  final String poster;

  @HiveField(6)
  final String genre;

  @HiveField(7)
  final String director;

  @HiveField(8)
  final String metascore;

  @HiveField(9)
  final String country;

  @HiveField(10)
  final String language;

  MovieDetailedLocalModel(
      this.imdbID,
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
}
