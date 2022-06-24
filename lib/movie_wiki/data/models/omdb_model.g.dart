// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'omdb_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OmdbModel _$OmbdModelFromJson(Map<String, dynamic> json) => OmdbModel(
      json['Title'] as String,
      json['Year'] as String,
      json['Rated'] as String,
      json['Actors'] as String,
      json['Poster'] as String,
      json['Genre'] as String,
      json['Director'] as String,
      json['Metascore'] as String,
      json['Country'] as String,
      json['Language'] as String,
    );

Map<String, dynamic> _$OmbdModelToJson(OmdbModel instance) => <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'Rated': instance.rated,
      'Actors': instance.actors,
      'Poster': instance.poster,
      'Genre': instance.genre,
      'Director': instance.director,
      'Metascore': instance.metascore,
      'Country': instance.country,
      'Language': instance.language,
    };
