import 'package:notifications_microservice/src/app/data/postgres/postgre_database.dart';
import 'package:notifications_microservice/src/app/core/domain/entities/notification.dart';
import 'package:notifications_microservice/src/app/infra/inotification_database.dart';

class NotificationDatabaseImpl implements INotificationDatabase {
  NotificationDatabaseImpl({required this.datasource});
  final PostgreDatabase datasource;
  @override
  Future<NotificationEntity> createNotification(
      NotificationEntity notification) async {
    return await datasource.createNotification(notification)!;
  }

  @override
  Future<NotificationEntity> findNotification(String notificationId) async {
    return await datasource.findNotification(notificationId);
  }

  @override
  Future<List<NotificationEntity>> getNotifications() async {
    return datasource.getNotifications();
  }

  @override
  Future<NotificationEntity> saveNotification(
      NotificationEntity notification) async {
    return datasource.saveNotification(notification);
  }
}
