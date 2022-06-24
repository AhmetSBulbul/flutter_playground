// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detailed_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailedLocalModelAdapter
    extends TypeAdapter<MovieDetailedLocalModel> {
  @override
  final int typeId = 1;

  @override
  MovieDetailedLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailedLocalModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailedLocalModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.imdbID)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.year)
      ..writeByte(3)
      ..write(obj.rated)
      ..writeByte(4)
      ..write(obj.actors)
      ..writeByte(5)
      ..write(obj.poster)
      ..writeByte(6)
      ..write(obj.genre)
      ..writeByte(7)
      ..write(obj.director)
      ..writeByte(8)
      ..write(obj.metascore)
      ..writeByte(9)
      ..write(obj.country)
      ..writeByte(10)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailedLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
