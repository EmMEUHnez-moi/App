import 'package:emmeuhnez_moi_app/core/storage/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:emmeuhnez_moi_app/core/network/dio_client.dart';
import 'package:emmeuhnez_moi_app/trajets/model/user.dart';
import 'package:emmeuhnez_moi_app/trajets/model/trip.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class TrajetsRepository {
  final Dio dio = DioClient.getInstance();

  Future<void> createTrip(
      String lieuDeDepart,
      String destination,
      String dateDeDepart,
      String horaireDeDepart,
      int placesDisponibles) async {
    const String url = 'http://127.0.0.1:8080/trip';
    final body = jsonEncode({
      'from_location': lieuDeDepart,
      'to_location': destination,
      'start_date': dateDeDepart,
      'hour_of_departure': horaireDeDepart,
      'number_of_seats': placesDisponibles,
      'driver_id': await SecureStorage.getUserId()
    });
    final response = await dio.post(url,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: body);
    if (response.statusCode != 200) {
      throw Exception(response.statusCode);
    }
  }

  Future<List<Trip>> searchTrip(String fromLocation, String toLocation,
      TimeOfDay hourOfDeparture, String user) {
    String url = 'http://127.0.0.1:8080/search/trip?';
    if (fromLocation.isNotEmpty) {
      url += 'from_location=$fromLocation';
    }
    if (toLocation.isNotEmpty) {
      url += 'to_location=$toLocation&';
    }
    if (hourOfDeparture != TimeOfDay(hour: 00, minute: 00)) {
      url +=
          'hour_of_departure=${hourOfDeparture.hour}:${hourOfDeparture.minute}&';
    }
    if (user.isNotEmpty) {
      url += 'username=$user';
    }
    print(url);
    return dio.get(url).then((response) {
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data
            .map((trip) => Trip(
                  id: trip['id'] as int,
                  fromLocation: trip['from_location'],
                  toLocation: trip['to_location'],
                  startDate: DateTime.parse(trip['start_date']),
                  hourOfDeparture: TimeOfDay(
                    hour: int.parse(trip['hour_of_departure'].split(':')[0]),
                    minute: int.parse(trip['hour_of_departure'].split(':')[1]),
                  ),
                  numberOfSeats: trip['number_of_seats'] as int,
                  driver: User(
                      id: trip['driver']['id'],
                      name: trip['driver']['name'],
                      surname: trip['driver']['surname'],
                      email: trip['driver']['email']),
                ))
            .toList();
      } else {
        throw Exception('Failed to load trips');
      }
    });
  }

  Future<void> book(int tripId) async {
    String url =
        "http://127.0.0.1:8080/trip/$tripId/passagers/${await SecureStorage.getUserId()}";
    return dio.post(url).then((response) {
      if (response.statusCode != 200) {
        throw Exception('Failed to book trip');
      }
    });
  }

  Future<List<Trip>> searchMineTrip() async {
    String url =
        "http://127.0.0.1:8080/user/${await SecureStorage.getUserId()}/trips";
    print(url);
    return dio.get(url).then((response) {
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data
            .map((trip) => Trip(
                  id: trip['id'] as int,
                  fromLocation: trip['from_location'],
                  toLocation: trip['to_location'],
                  startDate: DateTime.parse(trip['start_date']),
                  hourOfDeparture: TimeOfDay(
                    hour: int.parse(trip['hour_of_departure'].split(':')[0]),
                    minute: int.parse(trip['hour_of_departure'].split(':')[1]),
                  ),
                  numberOfSeats: trip['number_of_seats'] as int,
                  driver: User(
                      id: trip['driver']['id'],
                      name: trip['driver']['name'],
                      surname: trip['driver']['surname'],
                      email: trip['driver']['email']),
                ))
            .toList();
      } else {
        throw Exception('Failed to load trips');
      }
    });
  }
}
