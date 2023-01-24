import 'dart:convert';

import 'package:notifications_microservice/src/app/core/domain/entities/notification.dart';
import 'package:shelf/shelf.dart';

class NotificationResponse {
  NotificationResponse({NotificationEntity? notification});
  NotificationEntity? notification;

  NotificationResponse notificationResponse(
      NotificationEntity notification) {
    return NotificationResponse(notification: notification);
  }

  static Future<Response> createNotification({required NotificationResponse response}) async {
    final responseData = {
      "notificationId": response.notification!.getId(),
      "properties": response.notification!.getProperties(),
    };

    final body = jsonEncode(responseData);
    if (response.notification!.getId() != null) {
      return Response(202, body: body, headers: {"content-type":"application/json"});
    }

    return Response(404, body: {"message": "Not Found"});
  }
}
