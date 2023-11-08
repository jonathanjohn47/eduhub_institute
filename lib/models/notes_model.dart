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
  String pdfLink;

  NotesModel({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryModel,
    required this.pdfLink,
  });

  NotesModel copyWith({
    String? id,
    String? name,
    String? description,
    CategoryModel? categoryModel,
    String? pdfLink,
  }) =>
      NotesModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        categoryModel: categoryModel ?? this.categoryModel,
        pdfLink: pdfLink ?? this.pdfLink,
      );

  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        categoryModel: CategoryModel.fromJson(json["category_model"]),
        pdfLink: json["pdf_link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category_model": categoryModel.toJson(),
        "pdf_link": pdfLink,
      };
}
