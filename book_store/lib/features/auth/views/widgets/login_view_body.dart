import 'package:go_router/go_router.dart';

import '../../../../constat.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/style.dart';
import '../../data/authcubit/auth_cubit.dart';
import 'custom_button.dart';
import 'custom_text_form_feild.dart';
import 'sign_up_button_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passController;
  @override
  void initState() {
    emailController = TextEditingController();
    emailController.text = '@gmail.com';
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    debugPrint('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return SafeArea(
      child: Form(
        key: formKey,
        child: ModalProgressHUD(
          color: kPrimaryColor,
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
            child: BlocListener<AuthCubit, AuthState>(
              listener: (_, state) {
                if (state is AuthLoading) {
                  isLoading = true;
                } else if (state is AuthSuccess) {
                  isLoading = false;
                  GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                } else if (state is AuthFailure) {
                  isLoading = true;
                  debugPrint(state.errorMessage);

                  state.customShowSnackBar(context, state);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 16),
                    child: Text(
                      "Login",
                      style: Style.textStyle30.copyWith(fontSize: 50),
                    ),
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 12),
                  CustomTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passController,
                    labelText: 'Password',
                  ),
                  CustoomButtom(
                    text: 'Login',
                    onPressed: onSave,
                  ),
                  const SignUpButtonText()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onSave() async {
    if (formKey.currentState!.validate()) {
      await BlocProvider.of<AuthCubit>(context).login(
        email: emailController.text,
        password: passController.text,
      );
    }
  }
}
