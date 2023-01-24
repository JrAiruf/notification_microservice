import 'package:mockito/mockito.dart';
import 'package:notifications_microservice/src/app/core/domain/entities/notification.dart';
import 'package:notifications_microservice/src/app/data/postgres/postgre_database.dart';
import 'package:test/test.dart';

class DatabaseMock extends Mock implements PostgreDatabase {}

void main() async {
  final database = await DatabaseMock();
  test('Should return create a Notification in database', () async {
    when(database.createNotification(any)).thenAnswer((realInvocation) async => NotificationEntity());
    final notification = NotificationEntity(
        notificationId: "", properties: NotificationProperties());
    final result = await database.createNotification(notification);
    expect(result, isA<NotificationEntity>());
  });
}
