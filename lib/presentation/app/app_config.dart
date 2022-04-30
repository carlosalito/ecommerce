import 'dart:async';

import 'package:e_commerce_desafio/infra/failure/failure.dart';

class AppConfig {
  final StreamController<Failure?> streamError;
  final void Function() onDispose;

  static late AppConfig _instance;

  factory AppConfig({
    required StreamController<Failure?> streamError,
    required void Function() onDispose,
  }) {
    _instance = AppConfig._internal(streamError, onDispose);
    return _instance;
  }

  AppConfig._internal(
    this.streamError,
    this.onDispose,
  );

  static AppConfig get instance => _instance;
}
