// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  
}

class LoginLoaded extends LoginState {}

class LoginFailure extends LoginState {
  final Exception e;
  LoginFailure({
    required this.e,
  });
}
