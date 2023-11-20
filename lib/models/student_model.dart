// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

StudentModel studentModelFromJson(String str) =>
    StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  String firstName;
  String lastName;
  String profilePicLink;
  String phoneNumber;
  String email;
  DateTime joinedOn;
  DateTime dateOfBirth;

  StudentModel({
    required this.firstName,
    required this.lastName,
    required this.profilePicLink,
    required this.phoneNumber,
    required this.email,
    required this.joinedOn,
    required this.dateOfBirth,
  });

  StudentModel copyWith({
    String? firstName,
    String? lastName,
    String? profilePicLink,
    String? phoneNumber,
    String? email,
    DateTime? joinedOn,
    DateTime? dateOfBirth,
  }) =>
      StudentModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        profilePicLink: profilePicLink ?? this.profilePicLink,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        joinedOn: joinedOn ?? this.joinedOn,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      );

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        profilePicLink: json["profilePicLink"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        joinedOn: DateTime.parse(json["joinedOn"]),
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "profilePicLink": profilePicLink,
        "phoneNumber": phoneNumber,
        "email": email,
        "joinedOn": joinedOn.toIso8601String(),
        "dateOfBirth": dateOfBirth.toIso8601String(),
      };

  static StudentModel empty() {
    return StudentModel(
      firstName: "",
      lastName: "",
      profilePicLink: "",
      phoneNumber: "",
      email: "",
      joinedOn: DateTime.now(),
      dateOfBirth: DateTime.now(),
    );
  }
}
