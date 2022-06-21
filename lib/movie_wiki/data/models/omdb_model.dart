// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OmdbModel {
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

  OmdbModel(
    this.title,
    this.year,
    this.rated,
    this.actors,
    this.poster,
    this.genre,
    this.director,
    this.metascore,
    this.country,
    this.language,
  );

  OmdbModel copyWith({
    String? title,
    String? year,
    String? rated,
    String? actors,
    String? poster,
    String? genre,
    String? director,
    String? metascore,
    String? country,
    String? language,
  }) {
    return OmdbModel(
      title ?? this.title,
      year ?? this.year,
      rated ?? this.rated,
      actors ?? this.actors,
      poster ?? this.poster,
      genre ?? this.genre,
      director ?? this.director,
      metascore ?? this.metascore,
      country ?? this.country,
      language ?? this.language,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'year': year,
      'rated': rated,
      'actors': actors,
      'poster': poster,
      'genre': genre,
      'director': director,
      'metascore': metascore,
      'country': country,
      'language': language,
    };
  }

  factory OmdbModel.fromMap(Map<String, dynamic> map) {
    return OmdbModel(
      map['Title'] as String,
      map['Year'] as String,
      map['Rated'] as String,
      map['Actors'] as String,
      map['Poster'] as String,
      map['Genre'] as String,
      map['Director'] as String,
      map['Metascore'] as String,
      map['Country'] as String,
      map['Language'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OmdbModel.fromJson(String source) =>
      OmdbModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OmdbModel(title: $title, year: $year, rated: $rated, actors: $actors, poster: $poster, genre: $genre, director: $director, metascore: $metascore, country: $country, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OmdbModel &&
        other.title == title &&
        other.year == year &&
        other.rated == rated &&
        other.actors == actors &&
        other.poster == poster &&
        other.genre == genre &&
        other.director == director &&
        other.metascore == metascore &&
        other.country == country &&
        other.language == language;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        year.hashCode ^
        rated.hashCode ^
        actors.hashCode ^
        poster.hashCode ^
        genre.hashCode ^
        director.hashCode ^
        metascore.hashCode ^
        country.hashCode ^
        language.hashCode;
  }
}
