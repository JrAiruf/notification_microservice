import 'package:notifications_microservice/src/app/core/modules/initial_module.dart';
import 'package:shelf_modular/shelf_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [...InitialModule.dependencies];

  @override
  List<ModularRoute> get routes => [];
}