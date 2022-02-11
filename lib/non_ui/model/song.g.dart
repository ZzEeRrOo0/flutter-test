// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
      artist_names: json['artist_names'] as String,
      full_title: json['full_title'] as String,
      song_art_image_url: json['song_art_image_url'] as String,
    );

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'artist_names': instance.artist_names,
      'full_title': instance.full_title,
      'song_art_image_url': instance.song_art_image_url,
    };
