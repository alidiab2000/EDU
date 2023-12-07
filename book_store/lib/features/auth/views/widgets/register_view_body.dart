import '../../../../constat.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/style.dart';
import '../../data/authcubit/auth_cubit.dart';
import 'custom_button.dart';
import 'custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<RegisterViewBody> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  @override
  void initState() {
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    nameController.dispose();
    phoneController.dispose();
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
                  GoRouter.of(context).pushReplacement(AppRouter.kHomeView,
                      extra: {
                        'name': nameController.text,
                        'phone': phoneController.text
                      });
                } else if (state is AuthFailure) {
                  isLoading = true;
                  state.customShowSnackBar(context, state);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  Text(
                    "Register",
                    style: Style.textStyle30.copyWith(fontSize: 40),
                  ),
                  const SizedBox(height: 12),
                  CustomTextFormField(
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    labelText: 'Full Name',
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.name,
                    controller: phoneController,
                    labelText: 'Phone',
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    labelText: 'Email',
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passController,
                    labelText: 'Password',
                  ),
                  CustoomButtom(
                    text: 'Register',
                    onPressed: onSave,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Do you have an account?",
                        style: Style.textStyle14,
                      ),
                      TextButton(
                          onPressed: () {
                            GoRouter.of(context)
                                .pushReplacement(AppRouter.kLoginView);
                          },
                          child: const Text(
                            'Sign in',
                            style: Style.textStyle14,
                          ))
                    ],
                  )
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
      await BlocProvider.of<AuthCubit>(context).register(
        email: emailController.text,
        password: passController.text,
      );
    }
  }
}
