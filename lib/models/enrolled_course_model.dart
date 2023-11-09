// To parse this JSON data, do
//
//     final enrolledCourseModel = enrolledCourseModelFromJson(jsonString);

import 'dart:convert';

import 'course_model.dart';

List<EnrolledCourseModel> enrolledCourseModelFromJson(String str) =>
    List<EnrolledCourseModel>.from(
        json.decode(str).map((x) => EnrolledCourseModel.fromJson(x)));

String enrolledCourseModelToJson(List<EnrolledCourseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EnrolledCourseModel {
  CourseModel courseModel;
  double percentCompleted;
  DateTime startedOn;

  EnrolledCourseModel({
    required this.courseModel,
    required this.percentCompleted,
    required this.startedOn,
  });

  EnrolledCourseModel copyWith({
    CourseModel? courseModel,
    double? percentCompleted,
    DateTime? startedOn,
  }) =>
      EnrolledCourseModel(
        courseModel: courseModel ?? this.courseModel,
        percentCompleted: percentCompleted ?? this.percentCompleted,
        startedOn: startedOn ?? this.startedOn,
      );

  factory EnrolledCourseModel.fromJson(Map<String, dynamic> json) =>
      EnrolledCourseModel(
        courseModel: CourseModel.fromJson(json["course_model"]),
        percentCompleted: json["percent_completed"]?.toDouble(),
        startedOn: DateTime.parse(json["started_on"]),
      );

  Map<String, dynamic> toJson() => {
        "course_model": courseModel.toJson(),
        "percent_completed": percentCompleted,
        "started_on": startedOn.toIso8601String(),
      };
}
