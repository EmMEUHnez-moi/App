import 'package:dio/dio.dart';
import 'package:emmeuhnez_moi_app/core/storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  bool _isRefreshing = false;
  Future<String?>? _refreshTokenFuture;

  AuthInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await SecureStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final newToken = await _handleTokenRefresh();
      if (newToken != null) {
        err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
        final retryResponse = await dio.fetch(err.requestOptions);
        return handler.resolve(retryResponse);
      }
    }
    handler.next(err);
  }

  Future<String?> _handleTokenRefresh() async {
    if (_isRefreshing) return _refreshTokenFuture;

    _isRefreshing = true;
    _refreshTokenFuture = _refreshToken();
    final newToken = await _refreshTokenFuture;
    _isRefreshing = false;
    return newToken;
  }

  Future<String?> _refreshToken() async {
    final refreshToken = await SecureStorage.getRefreshToken();
    if (refreshToken == null) {
      await SecureStorage.clearTokens();
      return null;
    }
    //'http://127.0.0.1:8080/accounts/refresh?refresh_token=$refreshToken'
    try {
      final response = await dio.post(
        "http://127.0.0.1:8080/accounts/refresh?refresh_token=$refreshToken",
      );

      final newAccessToken = response.data['access_token'];
      final newRefreshToken = response.data['refresh_token'];

      await SecureStorage.saveTokens(newAccessToken, newRefreshToken);
      return newAccessToken;
    } catch (e) {
      await SecureStorage.clearTokens();
      return null;
    }
  }
}
