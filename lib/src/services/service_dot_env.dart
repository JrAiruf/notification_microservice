import 'dart:io';

class ServiceDotEnv {
  ServiceDotEnv() {
    _init();
  }

  static final _map = {};

  _init() {
    final file = File("/.env");
    final content = file.readAsStringSync();
    for (var line in content.split('\n')) {
      final lineBreak = line.split('=');
      _map[lineBreak[0]] = lineBreak[1];
    }
  }

  String operator [](String key) {
    return _map[key];
  }
}
