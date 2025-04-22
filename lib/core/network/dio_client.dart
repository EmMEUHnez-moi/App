import 'package:dio/dio.dart';
import 'auth_interceptor.dart';

class DioClient {
  static final Dio _dio = Dio();

  static Dio getInstance() {
    _dio.interceptors.clear();
    _dio.interceptors.add(AuthInterceptor(_dio));
    return _dio;
  }
}
