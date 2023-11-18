// To parse this JSON data, do
//
//     final notesModel = notesModelFromJson(jsonString);

import 'dart:convert';

import 'category_model.dart';

List<NotesModel> notesModelFromJson(String str) =>
    List<NotesModel>.from(json.decode(str).map((x) => NotesModel.fromJson(x)));

String notesModelToJson(List<NotesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotesModel {
  String id;
  String name;
  String description;
  CategoryModel categoryModel;
  List<String> links;

  NotesModel({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryModel,
    required this.links,
  });

  NotesModel copyWith({
    String? id,
    String? name,
    String? description,
    CategoryModel? categoryModel,
    List<String>? links,
  }) =>
      NotesModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        categoryModel: categoryModel ?? this.categoryModel,
        links: links ?? this.links,
      );

  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        categoryModel: CategoryModel.fromJson(json["category_model"]),
        links: List<String>.from(json["links"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category_model": categoryModel.toJson(),
        "links": List<dynamic>.from(links.map((x) => x)),
      };
}
