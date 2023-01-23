import 'package:notifications_microservice/src/app/domain/contract/notification_contract.dart';
import 'package:notifications_microservice/src/app/domain/entities/notification.dart';

class NotificationUsecases {
  NotificationUsecases(NotificationContract? contract) : _contract = contract!;
  final NotificationContract _contract;

  Future<NotificationEntity> createNotification(NotificationEntity notification) async {
    return await _contract.createNotification(notification)!;
  }
  Future<NotificationEntity> findNotification(String notificationId) async {
    return await _contract.findNotification(notificationId)!;
  }
  Future<NotificationEntity> saveNotification(NotificationEntity notification) async {
    return await _contract.saveNotification(notification)!;
  }
  Future<List<NotificationEntity>> getNotifications() async {
    return await _contract.getNotifications()!;
  }

}
