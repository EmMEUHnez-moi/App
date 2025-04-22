part of 'create_trip_cubit.dart';

abstract class CreateTripEvent extends Equatable {
  const CreateTripEvent();

  @override
  List<Object> get props => [];
}

class CreateTripSubmitted extends CreateTripEvent {
  final String fromLocation;
  final String toLocation;
  final String startDate;
  final String endDate;
  final String hourOfDeparture;
  final String hourOfArrival;
  final int numberOfSeats;

  const CreateTripSubmitted(
      {required this.fromLocation,
      required this.toLocation,
      required this.startDate,
      required this.endDate,
      required this.hourOfDeparture,
      required this.hourOfArrival,
      required this.numberOfSeats});
}
