import 'dart:convert';

import 'package:notifications_microservice/src/app/domain/entities/notification.dart';
import 'package:shelf/shelf.dart';

class NotificationResponse {
  Future<Response> createNotification(NotificationEntity? notification) async {
    final response = {
      "notificationId": notification!.getId(),
      "properties": notification.getProperties(),
    };

    final body = jsonEncode(response);
    if (notification.getId() != null) {
      return Response(202, body: body);
    }

    return Response(404, body: {"message": "Not Found"});
  }
}
