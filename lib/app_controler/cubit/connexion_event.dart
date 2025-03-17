part of 'connexion_cubit.dart';

abstract class ConnexionEvent extends Equatable {
  const ConnexionEvent();

  @override
  List<Object> get props => [];
}

class ConnexionInitialEvent extends ConnexionEvent {}

class ConnexionSuccessEvent extends ConnexionEvent {}

class ConnexionFailureEvent extends ConnexionEvent {}
