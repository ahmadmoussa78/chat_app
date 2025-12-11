part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFauilre extends RegisterState {
  String errMessage;
  RegisterFauilre({required this.errMessage});
}
