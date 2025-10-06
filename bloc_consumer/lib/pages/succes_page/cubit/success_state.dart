import 'package:equatable/equatable.dart';

abstract class SuccessState extends Equatable {
  @override
  List<Object> get props => [];
}

class SuccessInitial extends SuccessState {}

class SuccessLoading extends SuccessState {}

class SuccessLoaded extends SuccessState {}

class SuccessError extends SuccessState {}
