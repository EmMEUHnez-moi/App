part of 'create_trip_cubit.dart';

abstract class CreateTripState extends Equatable {
  const CreateTripState();

  @override
  List<Object> get props => [];
}

class CreateTripInitial extends CreateTripState {}

class CreateTripLoading extends CreateTripState {}

class CreateTripSuccess extends CreateTripState {}

class CreateTripFailure extends CreateTripState {
  final String error;
  const CreateTripFailure(this.error);
}
