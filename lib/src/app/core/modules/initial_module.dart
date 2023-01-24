import 'package:notifications_microservice/src/app/core/controllers/notification_controller.dart';
import 'package:notifications_microservice/src/app/core/domain/usecases/notification_usecases.dart';
import 'package:notifications_microservice/src/app/infra/notification_repository.dart';
import 'package:notifications_microservice/src/services/service_dot_env.dart';
import 'package:shelf_modular/shelf_modular.dart';

import '../../data/postgres/postgre_database.dart';
import '../controllers/inotification_controller.dart';
import '../controllers/notification_response.dart';
import '../domain/contract/notification_contract.dart';

abstract class InitialModule {
  static final dependencies = <Bind>[
    Bind(((i) => ServiceDotEnv())),
    Bind((i) => PostgreDatabase(dotEnv: i())),
    Bind<NotificationContract>((i)=> NotificationRepository(database: i())),
    Bind(((i) => NotificationResponse())),
    Bind<INotificationController>(((i) => NotificationUsecases(contract: i(), reponse: i()))),
    Bind(((i) => NotificationController(controller: i()))),

  ];
}
