import 'package:notifications_microservice/src/app/core/domain/entities/notification.dart';

import 'notification_response.dart';

abstract class INotificationController {
  Future<NotificationResponse> createNotification({
      NotificationEntity? notification});
}
