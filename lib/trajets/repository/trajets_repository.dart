import 'package:http/http.dart';
import 'dart:convert';

class TrajetsRepository {
  Future<void> createTrip(String lieu_de_depart, String destination, String date_de_depart, String horaire_de_depart, int places_disponibles) async {
    const url = 'http://127.0.0.1:8080/trip';
    final uri = Uri.parse(url);
    final body = jsonEncode({
      'from_location': lieu_de_depart,
      'to_location': destination,
      'start_date' : date_de_depart,
      'end date' : date_de_depart,
      'hour_of_departure' : horaire_de_depart,
      'hour_of_arrival' : horaire_de_depart,
      'number_of_seats' : places_disponibles,

    });
    final response = await post(uri,
        headers: {'Content-Type': 'application/json'}, body: body);
    if (response.statusCode != 200) {
      throw Exception(response.statusCode);
    }
  }
}
