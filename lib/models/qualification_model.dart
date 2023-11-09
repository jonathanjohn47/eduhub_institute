// To parse this JSON data, do
//
//     final qualificationModel = qualificationModelFromJson(jsonString);

import 'dart:convert';

List<QualificationModel> qualificationModelFromJson(String str) => List<QualificationModel>.from(json.decode(str).map((x) => QualificationModel.fromJson(x)));

String qualificationModelToJson(List<QualificationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QualificationModel {
  int id;
  String name;

  QualificationModel({
    required this.id,
    required this.name,
  });

  QualificationModel copyWith({
    int? id,
    String? name,
  }) =>
      QualificationModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory QualificationModel.fromJson(Map<String, dynamic> json) => QualificationModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
