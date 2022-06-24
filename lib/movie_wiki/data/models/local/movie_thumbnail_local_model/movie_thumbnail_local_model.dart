import 'package:hive/hive.dart';
part 'movie_thumbnail_local_model.g.dart';

@HiveType(typeId: 0)
class MovieThumbnailLocalModel {
  @HiveField(0)
  final String imdbID;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String year;

  @HiveField(3)
  final String type;

  @HiveField(4)
  final String poster;

  MovieThumbnailLocalModel(
      this.imdbID, this.title, this.year, this.type, this.poster);
}
