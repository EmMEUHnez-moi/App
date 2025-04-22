import 'package:dio/dio.dart';
import 'package:emmeuhnez_moi_app/core/network/dio_client.dart';
import 'package:emmeuhnez_moi_app/core/storage/secure_storage.dart';
import 'dart:convert';

class LoginRepository {
  final Dio dio = DioClient.getInstance();

  Future<bool> login(String email, String password) async {
    const String url = 'http://127.0.0.1:8080/accounts/token';
    final body = jsonEncode({
      'login': email,
      'password': password,
    });
    final response = await dio.post(url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
        data: body);
    if (response.statusCode == 200) {
      final accessToken = response.data['access_token'];
      final refreshToken = response.data['refresh_token'];
      final userId = response.data['user_id'];
      await SecureStorage.saveTokens(accessToken, refreshToken);
      await SecureStorage.saveUserId(userId);
      return true;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<void> logout() async {
    await SecureStorage.clearTokens();
  }
}
