// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_thumbnail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieThumbnailModel _$MovieThumbnailModelFromJson(Map<String, dynamic> json) =>
    MovieThumbnailModel(
      json['Title'] as String,
      json['Year'] as String,
      json['imdbID'] as String,
      json['Type'] as String,
      json['Poster'] as String,
    );

Map<String, dynamic> _$MovieThumbnailModelToJson(
        MovieThumbnailModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'imdbID': instance.imdbID,
      'type': instance.type,
      'poster': instance.poster,
    };
