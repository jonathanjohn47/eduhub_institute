// To parse this JSON data, do
//
//     final chapterModel = chapterModelFromJson(jsonString);

import 'dart:convert';

ChapterModel chapterModelFromJson(String str) => ChapterModel.fromJson(json.decode(str));

String chapterModelToJson(ChapterModel data) => json.encode(data.toJson());

class ChapterModel {
  String id;
  String name;
  String description;
  String thumbnail;
  List<String> videosLinks;

  ChapterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.videosLinks,
  });

  ChapterModel copyWith({
    String? id,
    String? name,
    String? description,
    String? thumbnail,
    List<String>? videosLinks,
  }) =>
      ChapterModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        thumbnail: thumbnail ?? this.thumbnail,
        videosLinks: videosLinks ?? this.videosLinks,
      );

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    thumbnail: json["thumbnail"],
    videosLinks: List<String>.from(json["videos_links"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "thumbnail": thumbnail,
    "videos_links": List<dynamic>.from(videosLinks.map((x) => x)),
  };
}
