import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class HttpClient {
  final Dio _dio;

  HttpClient({required Dio dio}) : _dio = dio;

  Future<Response> get(String endpoint) {
    return _dio.get(endpoint);
  }
}
