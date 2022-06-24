import 'package:equatable/equatable.dart';

class Movie extends Equatable {
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

  Movie(this.title, this.year, this.rated, this.actors, this.poster, this.genre,
      this.director, this.metascore, this.country, this.language);

  @override
  List<Object?> get props => [
        title,
        year,
        rated,
        actors,
        poster,
        genre,
        director,
        metascore,
        country,
        language
      ];
}
