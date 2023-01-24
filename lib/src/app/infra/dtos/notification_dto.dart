import 'package:notifications_microservice/src/app/core/domain/entities/notification.dart';

class NotificationDto {
  static NotificationEntity notificationData(Map<String, dynamic> data, Map<String,dynamic> props) {
    return NotificationEntity(notificationId: data["notificationId"],properties: props["properties"]);
  }
}
