import 'package:notifications_microservice/src/app/domain/contract/notification_contract.dart';
import 'package:notifications_microservice/src/app/domain/entities/notification.dart';

class NotificationUsecases {
  NotificationUsecases(NotificationContract? contract) : _contract = contract!;
  final NotificationContract _contract;

  Future<Notification> createNotification(Notification notification) async {
    return await _contract.createNotification(notification)!;
  }
  Future<Notification> findNotification(String notificationId) async {
    return await _contract.findNotification(notificationId)!;
  }
  Future<Notification> saveNotification(Notification notification) async {
    return await _contract.saveNotification(notification)!;
  }
  Future<List<Notification>> getNotifications() async {
    return await _contract.getNotifications()!;
  }

}
