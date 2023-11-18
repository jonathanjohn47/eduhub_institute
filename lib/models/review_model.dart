// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

import 'package:eduhub_institute/models/student_model.dart';

List<ReviewModel> reviewModelFromJson(String str) => List<ReviewModel>.from(
    json.decode(str).map((x) => ReviewModel.fromJson(x)));

String reviewModelToJson(List<ReviewModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReviewModel {
  String id;
  String title;
  String text;
  double givenRating;
  int overallRating;
  DateTime dateTime;
  StudentModel studentModel;

  ReviewModel({
    required this.id,
    required this.title,
    required this.text,
    required this.givenRating,
    required this.overallRating,
    required this.dateTime,
    required this.studentModel,
  });

  ReviewModel copyWith({
    String? id,
    String? title,
    String? text,
    double? givenRating,
    int? overallRating,
    DateTime? dateTime,
    StudentModel? studentModel,
  }) =>
      ReviewModel(
        id: id ?? this.id,
        title: title ?? this.title,
        text: text ?? this.text,
        givenRating: givenRating ?? this.givenRating,
        overallRating: overallRating ?? this.overallRating,
        dateTime: dateTime ?? this.dateTime,
        studentModel: studentModel ?? this.studentModel,
      );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json["id"],
        title: json["title"],
        text: json["text"],
        givenRating: json["given_rating"]?.toDouble(),
        overallRating: json["overall_rating"],
        dateTime: DateTime.parse(json["date_time"]),
        studentModel: StudentModel.fromJson(json["student_model"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "text": text,
        "given_rating": givenRating,
        "overall_rating": overallRating,
        "date_time": dateTime.toIso8601String(),
        "student_model": studentModel.toJson(),
      };
}
