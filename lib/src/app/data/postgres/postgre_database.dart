import 'dart:async';
import 'package:notifications_microservice/src/app/data/querys/database_query.dart';
import 'package:notifications_microservice/src/app/core/domain/entities/notification.dart';
import 'package:postgres/postgres.dart';

import '../../infra/dtos/notification_dto.dart';
import '../../../services/service_dot_env.dart';
import '../errors/notification_errors.dart';

class PostgreDatabase {
  PostgreDatabase({required this.dotEnv}) {
    _init();
  }
  final ServiceDotEnv dotEnv;

  Future<List<Map<String, Map<String, dynamic>>>> databaseQuery(String query,
      {Map<String, dynamic> variables = const {}}) async {
    final connection = await completer.future;
    return await connection.mappedResultsQuery(query,
        substitutionValues: variables);
  }

  Future<NotificationEntity>? createNotification(
      NotificationEntity? notification) async {
    try {
      final result = await databaseQuery(DatabaseQuery.createNotification);
      final notificationsList = result
          .map((item) => NotificationDto.notificationData(
              item['notificationId']!, item['properties']!))
          .toList();
      final newNotification = notificationsList.firstWhere((item) {
        return item.getId() == notification!.getId();
      });
      return newNotification;
    } on NotificationError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<NotificationEntity> findNotification(String notificationId) {
    throw UnimplementedError();
  }

  Future<List<NotificationEntity>> getNotifications() {
    throw UnimplementedError();
  }

  Future<NotificationEntity> saveNotification(NotificationEntity notification) {
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
