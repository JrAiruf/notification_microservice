import 'package:notifications_microservice/src/app/domain/entities/notification.dart';

abstract class INotificationDatabase {
  Future<NotificationEntity>? createNotification(NotificationEntity notification);
  Future<NotificationEntity>? findNotification(String notificationId);
  Future<NotificationEntity>? saveNotification(NotificationEntity notification);
  Future<List<NotificationEntity>>? getNotifications();
  
}