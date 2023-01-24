import 'package:notifications_microservice/src/app/core/domain/entities/notification.dart';

abstract class NotificationContract {
  Future<NotificationEntity> createNotification(NotificationEntity? notification);
  Future<NotificationEntity> findNotification(String? notificationId);
  Future<NotificationEntity> saveNotification(NotificationEntity? notification);
  Future<List<NotificationEntity>> getNotifications();
}
