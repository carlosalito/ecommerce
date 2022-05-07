import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @factoryMethod
  Dio dio() => Dio();

  @singleton
  DefaultCacheManager defaultCacheManager() => DefaultCacheManager();
}
