import 'package:notifications_microservice/src/app/core/controllers/inotification_controller.dart';
import 'package:notifications_microservice/src/app/core/controllers/notification_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

import '../../../services/mappers.dart';

class NotificationController extends Resource {
  NotificationController({this.controller});
  @override
  List<Route> get routes => [
        Route.post('/notifications', _createNotification),
      ];

  final INotificationController? controller;

  Future<Response> _createNotification(
      ModularArguments arguments, Injector injector) async {
    final notification = NotificationEntityMapper.toNotificationEntity(
        notificationMap: arguments.data);
    final response = await controller!.createNotification(notification: notification);
    return NotificationResponse.createNotification(response: response);
  }
}
