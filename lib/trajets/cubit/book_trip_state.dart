part of 'book_trip_cubit.dart';

abstract class BookTripState extends Equatable {
  const BookTripState();

  @override
  List<Object> get props => [];
}

class BookTripInitial extends BookTripState {}

class BookTripLoading extends BookTripState {}

class BookTripSuccess extends BookTripState {}

class BookTripFailure extends BookTripState {
  final String error;
  const BookTripFailure(this.error);
}
