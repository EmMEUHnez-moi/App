import 'package:http/http.dart';
import 'dart:convert';

class RegisterRepository {
  Future<void> register(String email, String password, String name,
      String surname, String dateOfBirth, String phoneNumber) async {
    const url = 'http://127.0.0.1:8080/user';
    final uri = Uri.parse(url);
    final body = jsonEncode({
      "name": name,
      "surname": surname,
      "email": email,
      "password": password,
      "birth_date": dateOfBirth,
      "phone_number": phoneNumber,
    });
    final response = await post(uri,
        headers: {'Content-Type': 'application/json'}, body: body);
    if (response.statusCode != 200) {
      throw Exception(response.statusCode);
    }
  }
}
