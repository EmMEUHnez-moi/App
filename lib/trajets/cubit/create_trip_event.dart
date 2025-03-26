part of 'create_trip_cubit.dart';

abstract class CreateTripEvent extends Equatable {
  const CreateTripEvent();

  @override
  List<Object> get props => [];
}

class CreateTripSubmitted extends CreateTripEvent {
  final String from_location;
  final String to_location;
  final String start_date;
  final String end_date;
  final String hour_of_departure;
  final String hour_of_arrival;
  final int number_of_seats;

  const CreateTripSubmitted({required this.from_location, required this.to_location, required this.start_date, required this.end_date, required this.hour_of_departure,
  required this.hour_of_arrival, required this.number_of_seats});
}
