// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  String id;
  String title;
  String message;
  DateTime sentAt;
  bool read;
  NotificationCategory notificationCategory;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.sentAt,
    required this.read,
    required this.notificationCategory,
  });

  NotificationModel copyWith({
    String? id,
    String? title,
    String? message,
    DateTime? sentAt,
    bool? read,
    NotificationCategory? notificationCategory,
  }) =>
      NotificationModel(
        id: id ?? this.id,
        title: title ?? this.title,
        message: message ?? this.message,
        sentAt: sentAt ?? this.sentAt,
        read: read ?? this.read,
        notificationCategory: notificationCategory ?? this.notificationCategory,
      );

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    title: json["title"],
    message: json["message"],
    sentAt: DateTime.parse(json["sent_at"]),
    read: json["read"],
    notificationCategory: NotificationCategory.fromJson(json["notification_category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "message": message,
    "sent_at": sentAt.toIso8601String(),
    "read": read,
    "notification_category": notificationCategory.toJson(),
  };
}

class NotificationCategory {
  int id;
  String name;

  NotificationCategory({
    required this.id,
    required this.name,
  });

  NotificationCategory copyWith({
    int? id,
    String? name,
  }) =>
      NotificationCategory(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory NotificationCategory.fromJson(Map<String, dynamic> json) => NotificationCategory(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
