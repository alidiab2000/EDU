import 'package:book_store/features/auth/views/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/Logo.png'),
        const SizedBox(height: 20),
        const CustomTextFormField(),
        const SizedBox(height: 20),
        const CustomTextFormField(),
      ],
    );
  }
}
