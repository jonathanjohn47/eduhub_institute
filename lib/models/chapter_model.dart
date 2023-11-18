// To parse this JSON data, do
//
//     final chapterModel = chapterModelFromJson(jsonString);

import 'dart:convert';

List<ChapterModel> chapterModelFromJson(String str) => List<ChapterModel>.from(json.decode(str).map((x) => ChapterModel.fromJson(x)));

String chapterModelToJson(List<ChapterModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChapterModel {
  String id;
  String name;
  String description;
  String thumbnail;
  List<String> videosLinks;
  List<String> notes;

  ChapterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.videosLinks,
    required this.notes,
  });

  ChapterModel copyWith({
    String? id,
    String? name,
    String? description,
    String? thumbnail,
    List<String>? videosLinks,
    List<String>? notes,
  }) =>
      ChapterModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        thumbnail: thumbnail ?? this.thumbnail,
        videosLinks: videosLinks ?? this.videosLinks,
        notes: notes ?? this.notes,
      );

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    thumbnail: json["thumbnail"],
    videosLinks: List<String>.from(json["videos_links"].map((x) => x)),
    notes: List<String>.from(json["notes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "thumbnail": thumbnail,
    "videos_links": List<dynamic>.from(videosLinks.map((x) => x)),
    "notes": List<dynamic>.from(notes.map((x) => x)),
  };
}
