part of 'book_trip_cubit.dart';

abstract class BookTripEvent extends Equatable {
  const BookTripEvent();

  @override
  List<Object> get props => [];
}

class BookTripSubmitted extends BookTripEvent {
  final int tripId;
  const BookTripSubmitted({required this.tripId});
}
