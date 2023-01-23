import 'package:notifications_microservice/notifications_microservice.dart';
import 'package:shelf/shelf_io.dart' as shelf;

void main() async {
  final handler = await initServer();
  final server = await shelf.serve(handler, '0.0.0.0', 4467);
  print('Server running on[${server.address.host}], port:[${server.port}]');
}
