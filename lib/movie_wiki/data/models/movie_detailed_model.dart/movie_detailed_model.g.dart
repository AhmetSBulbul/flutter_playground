// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detailed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailedModel _$MovieDetailedModelFromJson(Map<String, dynamic> json) =>
    MovieDetailedModel(
      json['title'] as String,
      json['year'] as String,
      json['rated'] as String,
      json['actors'] as String,
      json['poster'] as String,
      json['genre'] as String,
      json['director'] as String,
      json['metascore'] as String,
      json['country'] as String,
      json['language'] as String,
    );

Map<String, dynamic> _$MovieDetailedModelToJson(MovieDetailedModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'rated': instance.rated,
      'actors': instance.actors,
      'poster': instance.poster,
      'genre': instance.genre,
      'director': instance.director,
      'metascore': instance.metascore,
      'country': instance.country,
      'language': instance.language,
    };
