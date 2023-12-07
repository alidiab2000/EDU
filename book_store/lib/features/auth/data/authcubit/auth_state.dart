part of 'auth_cubit.dart';


sealed class AuthState extends Equatable {

  const AuthState();


  @override

  List<Object> get props => [];

}


final class AuthInitial extends AuthState {}


final class AuthLoading extends AuthState {}


final class AuthSuccess extends AuthState {

  final String email;


  final String password;


  final String name;


  final String phone;

 

  AuthSuccess({
    required this.email,
    required this.name,
    required this.phone,
    required this.password,



  }) {
    
    SharedPref.setData(loginSharedPref, true);
    SharedPref.setData(nameSharedPref,name);
    SharedPref.setData(email,email );
    SharedPref.setData(loginSharedPref, true);
    SharedPref.setData(loginSharedPref, true);

    
  }

}


final class AuthFailure extends AuthState {

  final String errorMessage;


  const AuthFailure({required this.errorMessage});


  void customShowSnackBar(BuildContext context, AuthFailure state) {

    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(

        content: Text(state.errorMessage),

      ),

    );

  }

}

