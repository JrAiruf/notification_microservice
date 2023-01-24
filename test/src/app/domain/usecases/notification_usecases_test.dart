import 'package:mockito/mockito.dart';
import 'package:notifications_microservice/src/app/core/controllers/notification_response.dart';
import 'package:notifications_microservice/src/app/core/domain/entities/content.dart';
import 'package:notifications_microservice/src/app/core/domain/entities/notification.dart';
import 'package:notifications_microservice/src/app/core/domain/usecases/notification_usecases.dart';
import 'package:notifications_microservice/src/app/infra/notification_repository.dart';
import 'package:test/test.dart';

class RepositoryMock extends Mock implements NotificationRepository {}

void main() {
  final repository = RepositoryMock();
  final usecase = NotificationUsecases(contract: repository);
  test('Should create a Notification', () async {
    when(repository.createNotification(any)).thenAnswer((_) async => NotificationEntity());
    final notification = await usecase.createNotification();
    expect(notification, isA<NotificationResponse>());
  });
  test('Should return a Notification object', () async {
    final notification = await usecase.findNotification("");
    expect(notification, isA<NotificationEntity>());
  });
  test('Should save a Notification', () async {
    final notification = await usecase.saveNotification(NotificationEntity(notificationId: 
        "",properties: 
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
