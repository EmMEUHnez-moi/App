import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'connexion_state.dart';
part 'connexion_event.dart';

class ConnexionBloc extends Bloc<ConnexionEvent, ConnexionState> {
  ConnexionBloc() : super(ConnexionInitial()) {
    on<ConnexionInitialEvent>((event, emit) {
      emit(ConnexionInitial());
    });
    on<ConnexionSuccessEvent>((event, emit) {
      emit(ConnexionSuccess());
    });
    on<ConnexionFailureEvent>((event, emit) {
      emit(ConnexionFailure());
    });
  }
}
