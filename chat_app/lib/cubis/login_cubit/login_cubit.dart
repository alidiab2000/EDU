// ignore_for_file: avoid_print, unused_field

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  String? email_;
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoaded());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      email_ = email;
      emit(LoginSuccess());
    } on Exception catch (e) {
      emit(LoginFailure(e: e));
    }
  }
}
