part of 'connexion_cubit.dart';

abstract class ConnexionState extends Equatable {
  const ConnexionState();

  @override
  List<Object> get props => [];
}

class ConnexionInitial extends ConnexionState {}

class ConnexionSuccess extends ConnexionState {}

class ConnexionFailure extends ConnexionState {}
