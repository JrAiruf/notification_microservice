import 'package:notifications_microservice/src/app/core/domain/entities/notification.dart';

class NotificationEntityMapper {
  static toNotificationEntity({required Map<String, dynamic> notificationMap}) {
    return NotificationEntity(notificationId: 
        notificationMap["notificationId"], properties: notificationMap["properties"]);
  }
}
