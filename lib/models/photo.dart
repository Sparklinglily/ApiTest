// To parse this JSON data, do
//
//     final photoMode = photoModeFromJson(jsonString);

import 'dart:convert';

List<PhotoMode> photoModeFromJson(String str) =>
    List<PhotoMode>.from(json.decode(str).map((x) => PhotoMode.fromJson(x)));

String photoModeToJson(List<PhotoMode> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoMode {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  PhotoMode({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotoMode.fromJson(Map<String, dynamic> json) => PhotoMode(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
