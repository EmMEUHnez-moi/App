import 'package:emmeuhnez_moi_app/trajets/repository/trajets_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'book_trip_state.dart';
part 'book_trip_event.dart';

class BookTripBloc extends Bloc<BookTripEvent, BookTripState> {
  final TrajetsRepository repository;

  BookTripBloc(this.repository) : super(BookTripInitial()) {
    on<BookTripSubmitted>(_onBookTripSubmitted);
  }

  Future<void> _onBookTripSubmitted(
    BookTripSubmitted event,
    Emitter<BookTripState> emit,
  ) async {
    emit(BookTripLoading());
    try {
      await repository.book(event.tripId);
      emit(BookTripSuccess());
    } catch (e) {
      emit(BookTripFailure(e.toString()));
    }
  }
}
