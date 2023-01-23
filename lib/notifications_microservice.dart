import 'package:notifications_microservice/src/app/app_module.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

Future<Handler> initServer() async {
  final handler = Modular(module: AppModule(), middlewares: [logRequests()]);
  return handler;
}
