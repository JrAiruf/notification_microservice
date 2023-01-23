import 'dart:async';
import 'package:notifications_microservice/src/app/data/querys/database_query.dart';
import 'package:notifications_microservice/src/app/domain/entities/notification.dart';
import 'package:notifications_microservice/src/app/infra/inotification_database.dart';
import 'package:notifications_microservice/src/services/service_dot_env.dart';
import 'package:postgres/postgres.dart';

import '../infra/dtos/notification_dto.dart';
import 'errors/notification_errors.dart';

class PostgreDatabase implements INotificationDatabase {
  PostgreDatabase({required this.dotEnv}) {
    _init();
  }

  final ServiceDotEnv dotEnv;

  Future<List<Map<String, Map<String, dynamic>>>> _databaseQuery(String query,
      {Map<String, dynamic> variables = const {}}) async {
    final connection = await completer.future;
    return await connection.mappedResultsQuery(query, substitutionValues: variables);
  }

  @override
  Future<NotificationEntity>? createNotification(NotificationEntity notification) async {
   try {
      final result = await _databaseQuery(DatabaseQuery.createNotification);
      final notificationsList
       = result
          .map((item) => NotificationDto.notificationData(item['notificationId']!, item['properties']!))
          .toList();
          final newNotification = notificationsList.firstWhere((item) {
            return item.getId() == notification.getId();
          });
      return newNotification;
    } on NotificationError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<NotificationEntity>? findNotification(String notificationId) {
    // TODO: implement findNotification
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationEntity>>? getNotifications() {
    // TODO: implement getNotifications
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity>? saveNotification(NotificationEntity notification) {
    // TODO: implement saveNotification
    throw UnimplementedError();
  }

  var completer = Completer<PostgreSQLConnection>();

  void _init() async {
    final url = dotEnv["DATABASE_URL"];
    final uri = Uri.parse(url);
    final userInfo = uri.userInfo.split(':');
    var connection = PostgreSQLConnection(
        uri.host, uri.port, uri.pathSegments.first,
        username: userInfo[0], password: userInfo[1]);
    await connection.open();
    completer.complete(connection);
  }
}
