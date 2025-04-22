import 'package:emmeuhnez_moi_app/trajets/model/user.dart';
import 'package:flutter/material.dart';

class Trip {
  int id;
  String fromLocation;
  String toLocation;
  DateTime startDate;
  TimeOfDay hourOfDeparture;
  int numberOfSeats;
  User driver;

  Trip({
    required this.id,
    required this.fromLocation,
    required this.toLocation,
    required this.startDate,
    required this.hourOfDeparture,
    required this.numberOfSeats,
    required this.driver,
  });
}
