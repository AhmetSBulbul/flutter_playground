// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_thumbnail_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieThumbnailLocalModelAdapter
    extends TypeAdapter<MovieThumbnailLocalModel> {
  @override
  final int typeId = 0;

  @override
  MovieThumbnailLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieThumbnailLocalModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieThumbnailLocalModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.imdbID)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.year)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.poster);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieThumbnailLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
