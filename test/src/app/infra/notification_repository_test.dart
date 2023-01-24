import 'package:mockito/mockito.dart';
import 'package:notifications_microservice/src/app/core/domain/entities/notification.dart';
import 'package:notifications_microservice/src/app/data/postgres/postgre_database.dart';
import 'package:notifications_microservice/src/app/infra/notification_repository.dart';
import 'package:test/test.dart';

class DatabaseMock extends Mock implements PostgreDatabase {}

void main() {
  final database = DatabaseMock();
  final reporitory = NotificationRepository(database: database);
  test('notification repository ...', () async {
    final notification = NotificationEntity(
        notificationId: "", properties: NotificationProperties());
    when(database.createNotification(any))
        .thenAnswer((realInvocation) async => NotificationEntity());
    final result = await reporitory.createNotification(notification);
    expect(result, isA<NotificationEntity>());
    // TODO: Implement test
  });
}
