import 'package:notifications_microservice/src/app/domain/entities/content.dart';
import 'package:notifications_microservice/src/app/domain/entities/notification.dart';
import 'package:notifications_microservice/src/app/domain/usecases/notification_usecases.dart';
import 'package:notifications_microservice/src/app/repository/NotificationRepository.dart';
import 'package:test/test.dart';

void main() {
  final contract = NotificationRepository();
  final usecase = NotificationUsecases(contract);
  test('Should create a Notification', () async {
    final notification = await usecase.createNotification(Notification(
        "",
        NotificationProperties(
            content: Content("Você recebeu uma nova notificação"),
            createdAt: DateTime.now(),
            readAt: DateTime.now())));
    expect(notification, isA<Notification>());
  });
  test('Should return a Notification object', () async {
    final notification =  await usecase.findNotification("");
    expect(notification, isA<Notification>());
  });
  test('Should save a Notification', () async {
    final notification = await usecase.saveNotification(Notification(
        "",
        NotificationProperties(
            content: Content("Você recebeu uma nova notificação"),
            createdAt: DateTime.now(),
            readAt: DateTime.now())));
    expect(notification, isA<Notification>());
  });
  test('Should return a List of Notifications', () async {
    final notification = await usecase.getNotifications();
    expect(notification, isA<List<Notification>>());
  });
}
