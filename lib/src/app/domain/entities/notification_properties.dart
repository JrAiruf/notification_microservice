// ignore_for_file: public_member_api_docs, sort_constructors_first
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
