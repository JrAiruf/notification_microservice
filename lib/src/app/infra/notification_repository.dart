// ignore_for_file: file_names

import 'package:notifications_microservice/src/app/core/domain/entities/notification.dart';
import '../core/domain/contract/notification_contract.dart';
import '../data/postgres/postgre_database.dart';

class NotificationRepository implements NotificationContract {
  NotificationRepository({PostgreDatabase? database}) : _database = database!;
  final PostgreDatabase _database;

  @override
  Future<NotificationEntity> createNotification(
      NotificationEntity? notification) async {
    return await _database.createNotification(notification!)!;
  }

  @override
  Future<NotificationEntity> findNotification(String? notificationId) async {
    return await _database.findNotification(notificationId!);
  }

  @override
  Future<List<NotificationEntity>> getNotifications() async {
    return await _database.getNotifications();
  }

  @override
  Future<NotificationEntity> saveNotification(
      NotificationEntity? notification) async {
    return await _database.saveNotification(
        notification!);
  }
}
