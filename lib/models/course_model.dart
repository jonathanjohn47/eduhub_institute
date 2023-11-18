// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

import 'category_model.dart';

List<CourseModel> courseModelFromJson(String str) => List<CourseModel>.from(
    json.decode(str).map((x) => CourseModel.fromJson(x)));

String courseModelToJson(List<CourseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseModel {
  String id;
  String name;
  String description;
  int durationInDays;
  String imageLink;
  double price;
  CategoryModel categoryModel;
  List<String> courseVideosLinks;
  List<String> notesLinks;

  CourseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.durationInDays,
    required this.imageLink,
    required this.price,
    required this.categoryModel,
    required this.courseVideosLinks,
    required this.notesLinks,
  });

  CourseModel copyWith({
    String? id,
    String? name,
    String? description,
    int? durationInDays,
    String? imageLink,
    double? price,
    CategoryModel? categoryModel,
    List<String>? courseVideosLinks,
    List<String>? notesLinks,
  }) =>
      CourseModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        durationInDays: durationInDays ?? this.durationInDays,
        imageLink: imageLink ?? this.imageLink,
        price: price ?? this.price,
        categoryModel: categoryModel ?? this.categoryModel,
        courseVideosLinks: courseVideosLinks ?? this.courseVideosLinks,
        notesLinks: notesLinks ?? this.notesLinks,
      );

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        durationInDays: json["duration_in_days"],
        imageLink: json["image_link"],
        price: json["price"]?.toDouble(),
        categoryModel: CategoryModel.fromJson(json["category_model"]),
        courseVideosLinks:
            List<String>.from(json["course_videos_links"].map((x) => x)),
        notesLinks: List<String>.from(json["notes_links"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "duration_in_days": durationInDays,
        "image_link": imageLink,
        "price": price,
        "category_model": categoryModel.toJson(),
        "course_videos_links":
            List<dynamic>.from(courseVideosLinks.map((x) => x)),
        "notes_links": List<dynamic>.from(notesLinks.map((x) => x)),
      };
}
