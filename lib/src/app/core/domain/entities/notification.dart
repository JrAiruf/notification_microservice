// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'content.dart';

class NotificationEntity {
  final String? notificationId;
  final NotificationProperties? properties;

  NotificationEntity({this.notificationId, this.properties});

  String? getId() => notificationId;
  NotificationProperties? getProperties() => properties;

  void setRecipientId(String value) => properties?.recipientId = value;
  void setContent(String value) => properties?.content?.setContent(value);
  void setCategory(String value) => properties?.category = value;
  void setReadAt(DateTime value) => properties?.readAt = value;
  void setCreatedAt(DateTime value) => properties?.createdAt = value;
  void setCanceledAt(DateTime value) => properties?.canceledAt = value;
}

class NotificationProperties {
  String? recipientId;
  Content? content;
  String? category;
  DateTime? readAt;
  DateTime? canceledAt;
  DateTime? createdAt;

  NotificationProperties({
    this.recipientId,
    this.content,
    this.category,
    this.readAt,
    this.canceledAt,
    this.createdAt,
  });
}
