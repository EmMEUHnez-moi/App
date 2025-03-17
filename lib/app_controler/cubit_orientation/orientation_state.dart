part of 'orientation_cubit.dart';

class OrientationState extends Equatable {
  final OrientationItem orientation;
  const OrientationState({required this.orientation});

  @override
  List<Object> get props => [orientation];
}
