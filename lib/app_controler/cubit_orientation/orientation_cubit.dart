import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'orientation_state.dart';

enum OrientationItem { portrait, paysage }

OrientationItem orinetationInfo = OrientationItem.portrait;

class OrientationCubit extends Cubit<OrientationState> {
  OrientationCubit()
      : super(OrientationState(orientation: OrientationItem.portrait));

  getOrientationState(OrientationItem orientationInfo) {
    if (orientationInfo == OrientationItem.portrait) {
      orinetationInfo = OrientationItem.portrait;
      emit(OrientationState(orientation: OrientationItem.portrait));
    } else {
      orinetationInfo = OrientationItem.paysage;
      emit(OrientationState(orientation: OrientationItem.paysage));
    }
  }

  setOrientationState(OrientationItem orientationInfo) {
    if (orientationInfo == OrientationItem.portrait) {
      orinetationInfo = OrientationItem.portrait;
      emit(OrientationState(orientation: OrientationItem.portrait));
    } else {
      orinetationInfo = OrientationItem.paysage;
      emit(OrientationState(orientation: OrientationItem.paysage));
    }
  }
}
