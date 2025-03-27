import 'package:http/http.dart';
import 'package:emmeuhnez_moi_app/profil/model/user.dart';
import 'dart:convert';

class LoginRepository {
  Future<User> login(String email, String password) async {
    const url = 'http://127.0.0.1:8080/accounts/token';
    final uri = Uri.parse(url);
    final body = jsonEncode({
      'login': email,
      'password': password,
    });
    final response = await post(uri,
        headers: {'Content-Type': 'application/json'}, body: body);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return User.fromJson(json);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
