part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String message;

  RegisterFailure({required this.message});
}

class RegisterTrue extends RegisterState {
  final bool isSelected;

  RegisterTrue({required this.isSelected});
}

class RegisterFalse extends RegisterState {}
