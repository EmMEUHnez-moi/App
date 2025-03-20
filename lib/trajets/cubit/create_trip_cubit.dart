import 'package:emmeuhnez_moi_app/trajets/repository/trajets_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_trip_state.dart';
part 'create_trip_event.dart';

class CreateTripBloc extends Bloc<CreateTripEvent, CreateTripState> {
  final TrajetsRepository repository;

  CreateTripBloc(this.repository) : super(CreateTripInitial()) {
    on<CreateTripSubmitted>(_onCreateTripSubmitted);
  }

  Future<void> _onCreateTripSubmitted(
    CreateTripSubmitted event,
    Emitter<CreateTripState> emit,
  ) async {
    emit(CreateTripLoading());
    try {
      await repository.createTrip(event.from_location, event.to_location, event.start_date, event.hour_of_departure, event.number_of_seats);
      emit(CreateTripSuccess());
    } catch (e) {
      emit(CreateTripFailure(e.toString()));
    }
  }
}
