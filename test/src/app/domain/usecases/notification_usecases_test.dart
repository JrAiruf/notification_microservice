import 'package:notifications_microservice/src/app/data/notification_database_impl.dart';
import 'package:notifications_microservice/src/app/domain/entities/content.dart';
import 'package:notifications_microservice/src/app/domain/entities/notification.dart';
import 'package:notifications_microservice/src/app/domain/usecases/notification_usecases.dart';
import 'package:notifications_microservice/src/app/infra/notification_repository.dart';
import 'package:test/test.dart';

void main() {
  final database = NotificationDatabaseImpl();
  final contract = NotificationRepository(database);
  final usecase = NotificationUsecases(contract);
  test('Should create a Notification', () async {
    final notification = await usecase.createNotification(NotificationEntity(
        "",
        NotificationProperties(
            content: Content("Você recebeu uma nova notificação"),
            createdAt: DateTime.now(),
            readAt: DateTime.now())));
    expect(notification, isA<NotificationEntity>());
  });
  test('Should return a Notification object', () async {
    final notification = await usecase.findNotification("");
    expect(notification, isA<NotificationEntity>());
  });
  test('Should save a Notification', () async {
    final notification = await usecase.saveNotification(NotificationEntity(
        "",
        NotificationProperties(
            content: Content("Você recebeu uma nova notificação"),
            createdAt: DateTime.now(),
            readAt: DateTime.now())));
    expect(notification, isA<NotificationEntity>());
  });
  test('Should return a List of Notifications', () async {
    final notification = await usecase.getNotifications();
    expect(notification, isA<List<NotificationEntity>>());
  });
}
