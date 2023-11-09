// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

List<MessageModel> messageModelFromJson(String str) => List<MessageModel>.from(json.decode(str).map((x) => MessageModel.fromJson(x)));

String messageModelToJson(List<MessageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageModel {
  String id;
  String text;
  bool sentByStudent;
  int sentAt;
  bool readByStudent;
  bool readBySupport;

  MessageModel({
    required this.id,
    required this.text,
    required this.sentByStudent,
    required this.sentAt,
    required this.readByStudent,
    required this.readBySupport,
  });

  MessageModel copyWith({
    String? id,
    String? text,
    bool? sentByStudent,
    int? sentAt,
    bool? readByStudent,
    bool? readBySupport,
  }) =>
      MessageModel(
        id: id ?? this.id,
        text: text ?? this.text,
        sentByStudent: sentByStudent ?? this.sentByStudent,
        sentAt: sentAt ?? this.sentAt,
        readByStudent: readByStudent ?? this.readByStudent,
        readBySupport: readBySupport ?? this.readBySupport,
      );

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    id: json["id"],
    text: json["text"],
    sentByStudent: json["sent_by_student"],
    sentAt: json["sent_at"],
    readByStudent: json["read_by_student"],
    readBySupport: json["read_by_support"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "sent_by_student": sentByStudent,
    "sent_at": sentAt,
    "read_by_student": readByStudent,
    "read_by_support": readBySupport,
  };
}
