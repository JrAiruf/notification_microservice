// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'content.dart';

class Notification {
   String? _notificationId;
   NotificationProperties? _properties;

  String? getId() => _notificationId;
  NotificationProperties? getProperties() => _properties;

  void setRecipientId(String value) => _properties?.recipientId = value;
  void setContent(String value) => _properties?.content = value;
  void setCategory(String value) => _properties?.category = value;
  void setReadAt(DateTime value) => _properties?.readAt = value;
  void setCreatedAt(DateTime value) => _properties?.createdAt = value;
  void setCanceledAt(DateTime value) => _properties?.canceledAt = value;

}

class NotificationProperties {
  String? recipientId;
  String? content;
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

