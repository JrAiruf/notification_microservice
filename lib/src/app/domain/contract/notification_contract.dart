import 'package:notifications_microservice/src/app/domain/entities/notification.dart';

abstract class NotificationContract {
  Future<Notification>? createNotification(Notification notification);
  Future<Notification>? findNotification(String notificationId);
  Future<Notification>? saveNotification(Notification notification);
  Future<List<Notification>>? getNotifications();


}
