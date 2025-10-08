part of 'success_cubit.dart';

abstract class SuccessState {}

class SuccessInitial extends SuccessState {}

class SuccessLoading extends SuccessState {}

class SuccessLoaded extends SuccessState {
  final String username;
  final String email;
  final String phone;

  SuccessLoaded({
    required this.username,
    required this.email,
    required this.phone,
  });
}

class SuccessError extends SuccessState {
  final String message;
  SuccessError(this.message);
}
