import 'package:notifications_microservice/src/app/domain/entities/notification.dart';

class NotificationDto {
  static NotificationEntity notificationData(Map<String, dynamic> data, Map<String,dynamic> props) {
    return NotificationEntity(data["notificationId"], props["properties"]);
  }
}
