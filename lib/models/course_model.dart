// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

List<CourseModel> courseModelFromJson(String str) => List<CourseModel>.from(json.decode(str).map((x) => CourseModel.fromJson(x)));

String courseModelToJson(List<CourseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseModel {
  String id;
  String name;
  String description;
  int durationInDays;
  String imageLink;
  double price;

  CourseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.durationInDays,
    required this.imageLink,
    required this.price,
  });

  CourseModel copyWith({
    String? id,
    String? name,
    String? description,
    int? durationInDays,
    String? imageLink,
    double? price,
  }) =>
      CourseModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        durationInDays: durationInDays ?? this.durationInDays,
        imageLink: imageLink ?? this.imageLink,
        price: price ?? this.price,
      );

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    durationInDays: json["duration_in_days"],
    imageLink: json["image_link"],
    price: json["price"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "duration_in_days": durationInDays,
    "image_link": imageLink,
    "price": price,
  };
}
