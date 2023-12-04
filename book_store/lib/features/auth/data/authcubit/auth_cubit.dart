import 'package:bloc/bloc.dart';


import 'package:book_store/constat.dart';


import 'package:book_store/core/utils/shared_pref.dart';


import 'package:equatable/equatable.dart';


import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';


part 'auth_state.dart';


class AuthCubit extends Cubit<AuthState> {

  AuthCubit() : super(AuthInitial());


  Future<void> login({required String email, required String password ,
      required String name,

      required String phone }) async {

    try {

      Future.delayed(const Duration(seconds: 2));


      emit(AuthLoading());


      Future.delayed(const Duration(seconds: 2));


      await FirebaseAuth.instance

          .signInWithEmailAndPassword(

            email: email,

            password: password,

          )

          .then((value) => debugPrint(value.user!.email));


      emit(AuthSuccess(email: email, password: password , name: name , phone: phone));

    } on FirebaseAuthException catch (ex) {

      if (ex.code == 'user-not-found') {

        emit(AuthFailure(errorMessage: ex.code));

      } else if (ex.code == 'wrong-password') {

        emit(AuthFailure(errorMessage: ex.code));

      } else if (ex.code == 'invalid-email') {

        emit(AuthFailure(errorMessage: ex.code));

      } else if (ex.code == 'invalid-credential') {

        emit(const AuthFailure(

            errorMessage: 'Plz try again with anthor email or password'));

      }


      debugPrint(ex.code);


      emit(AuthFailure(errorMessage: ex.code));

    } catch (e) {

      debugPrint(e.toString());


      emit(AuthFailure(errorMessage: e.toString()));

    }

  }


  Future register(

      {required String email,

      required String password,

      required String name,

      required String phone}) async {

    try {

      Future.delayed(const Duration(seconds: 2));


      emit(AuthLoading());


      await FirebaseAuth.instance.createUserWithEmailAndPassword(

        email: email,

        password: password,

      );


      emit(AuthSuccess(
        email: email,
        password: password,
        name: name,
        phone: phone,
      ));

    } on FirebaseAuthException catch (ex) {

      emit(AuthFailure(errorMessage: ex.code));

    } catch (e) {

      emit(AuthFailure(errorMessage: e.toString()));

    }

  }

}

