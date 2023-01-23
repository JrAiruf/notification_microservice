import 'package:notifications_microservice/src/app/domain/contract/notification_contract.dart';
import 'package:notifications_microservice/src/app/domain/entities/notification.dart';

class NotificationRepository implements NotificationContract {
  @override
  Future<Notification>? createNotification(Notification notification) async {
    return Notification("_notificationId", NotificationProperties());
  }

  @override
  Future<Notification>? findNotification(String notificationId) async {
    return Notification("_notificationId", NotificationProperties());
  }

  @override
  Future<List<Notification>>? getNotifications() async {
    final list = <Notification>[];
    return list;
  }

  @override
  Future<Notification>? saveNotification(Notification notification) async {
    return Notification("_notificationId", NotificationProperties());
  }
}
