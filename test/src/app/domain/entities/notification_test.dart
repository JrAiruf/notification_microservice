import 'package:notifications_microservice/src/app/domain/entities/content.dart';
import 'package:notifications_microservice/src/app/domain/entities/notification.dart';
import 'package:test/test.dart';

void main() {
  test('Should representate a notification correctly', () {
    final notification = Notification(
        "",
        NotificationProperties(
            content: Content("Você recebeu uma nova notificação"),
            createdAt: DateTime.now(),
            readAt: DateTime.now()));
    expect(notification.getProperties()?.content?.getContent(),
        equals("Você recebeu uma nova notificação"));
    expect(notification.getProperties()?.createdAt != null, 
        equals(true));
    expect(notification.getProperties()?.readAt != null, 
        equals(true));
  });
}
