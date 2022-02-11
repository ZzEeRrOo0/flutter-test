// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_local_datasource.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SongHiveAdapter extends TypeAdapter<SongHive> {
  @override
  final int typeId = 0;

  @override
  SongHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SongHive(
      artist_names: fields[0] as String,
      full_title: fields[1] as String,
      song_art_image_url: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SongHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.artist_names)
      ..writeByte(1)
      ..write(obj.full_title)
      ..writeByte(2)
      ..write(obj.song_art_image_url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SongHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
