import 'package:http/http.dart';
import 'dart:convert';

class TrajetsRepository {
  Future<void> createTrip(
      String lieuDeDepart,
      String destination,
      String dateDeDepart,
      String horaireDeDepart,
      int placesDisponibles) async {
    const url = 'http://127.0.0.1:8080/trip';
    final uri = Uri.parse(url);
    final body = jsonEncode({
      'from_location': lieuDeDepart,
      'to_location': destination,
      'start_date': dateDeDepart,
      'end date': dateDeDepart,
      'hour_of_departure': horaireDeDepart,
      'hour_of_arrival': horaireDeDepart,
      'number_of_seats': placesDisponibles,
    });
    final response = await post(uri,
        headers: {'Content-Type': 'application/json'}, body: body);
    if (response.statusCode != 200) {
      throw Exception(response.statusCode);
    }
  }
}
