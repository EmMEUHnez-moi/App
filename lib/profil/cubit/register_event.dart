part of 'register_cubit.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final String email;
  final String password;
  final String name;
  final String surname;
  final String dateOfBirth;
  final String phoneNumber;
  const RegisterSubmitted({
    required this.email,
    required this.password,
    required this.name,
    required this.surname,
    required this.dateOfBirth,
    required this.phoneNumber,
  });
}
