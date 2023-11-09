// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

import 'package:eduhub_institute/models/qualification_model.dart';

StudentModel studentModelFromJson(String str) =>
    StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  String firstName;
  String lastName;
  String email;
  String profilePicLink;
  String phoneNumber;
  DateTime joinedOn;
  DateTime dateOfBirth;

  StudentModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profilePicLink,
    required this.phoneNumber,
    required this.joinedOn,
    required this.dateOfBirth,
  });

  StudentModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? profilePicLink,
    String? phoneNumber,
    DateTime? joinedOn,
    DateTime? dateOfBirth,
  }) =>
      StudentModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        profilePicLink: profilePicLink ?? this.profilePicLink,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        joinedOn: joinedOn ?? this.joinedOn,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      );

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        profilePicLink: json["profile_pic_link"],
        phoneNumber: json["phone_number"],
        joinedOn: DateTime.parse(json["joined_on"]),
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "profile_pic_link": profilePicLink,
        "phone_number": phoneNumber,
        "joined_on": joinedOn.toIso8601String(),
        "date_of_birth": dateOfBirth.toIso8601String(),
      };

  static StudentModel empty() => StudentModel(
        firstName: '',
        lastName: '',
        email: '',
        profilePicLink: '',
        phoneNumber: '',
        joinedOn: DateTime.now(),
        dateOfBirth: DateTime.now(),
      );
}
