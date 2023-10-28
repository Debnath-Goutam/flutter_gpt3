part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpVerifying extends SignUpState {}

class SignUpVerified extends SignUpState {}

class SignUpError extends SignUpState {}