import 'package:json_annotation/json_annotation.dart';

part 'song.g.dart';

@JsonSerializable(explicitToJson: true)
class Song {
  Song({
    required this.artist_names,
    required this.full_title,
    required this.song_art_image_url,
  });

  final String artist_names;
  final String full_title;
  final String song_art_image_url;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  Map<String, dynamic> toJson() => _$SongToJson(this);
}
