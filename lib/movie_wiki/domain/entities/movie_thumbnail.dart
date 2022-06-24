import 'package:equatable/equatable.dart';

class MovieThumbnail extends Equatable {
  final String imdbId, title, year, type, poster;

  MovieThumbnail(this.imdbId, this.title, this.year, this.type, this.poster);

  @override
  List<Object?> get props => [imdbId, title, year, type, poster];
}
