import 'package:notifications_microservice/src/app/core/controllers/inotification_controller.dart';
import 'package:notifications_microservice/src/app/core/controllers/notification_response.dart';
import 'package:notifications_microservice/src/app/core/domain/contract/notification_contract.dart';
import 'package:notifications_microservice/src/app/core/domain/entities/notification.dart';

class NotificationUsecases implements INotificationController {
  NotificationUsecases({NotificationContract? contract, NotificationResponse? reponse});

  NotificationContract? contract;
  NotificationResponse? response;
  
@override
  Future<NotificationResponse> createNotification({
      NotificationEntity? notification}) async {
    return response!.notificationResponse(await contract!.createNotification(notification));
  }

  Future<NotificationEntity> findNotification(String notificationId) async {
    return await contract!.findNotification(notificationId);
  }

  Future<NotificationEntity> saveNotification(
      NotificationEntity notification) async {
    return await contract!.saveNotification(notification);
  }

  Future<List<NotificationEntity>> getNotifications() async {
    return await contract!.getNotifications();
  }
}
