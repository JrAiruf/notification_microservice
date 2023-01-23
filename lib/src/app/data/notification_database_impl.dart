import 'package:notifications_microservice/src/app/domain/entities/notification.dart';
import 'package:notifications_microservice/src/app/infra/inotification_database.dart';

class NotificationDatabaseImpl implements INotificationDatabase{
  @override
  Future<NotificationEntity>? createNotification(NotificationEntity notification) {
    // TODO: implement createNotification
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity>? findNotification(String notificationId) {
    // TODO: implement findNotification
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationEntity>>? getNotifications() {
    // TODO: implement getNotifications
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity>? saveNotification(NotificationEntity notification) {
    // TODO: implement saveNotification
    throw UnimplementedError();
  }
  
}