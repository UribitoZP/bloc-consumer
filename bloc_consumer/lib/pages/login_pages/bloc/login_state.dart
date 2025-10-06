import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String username;
  final String email;
  final String phone;

  const LoginSuccess({
    required this.username,
    required this.email,
    required this.phone,
  });

  @override
  List<Object> get props => [username, email, phone];
}

class LoginFailure extends LoginState {
  final String error;
  const LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}
