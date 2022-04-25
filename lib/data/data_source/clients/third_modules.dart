import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @factoryMethod
  Dio dio() => Dio();
}
