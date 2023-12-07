import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpButtonText extends StatelessWidget {
  const SignUpButtonText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: Style.textStyle14,
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRouter.kRegisterView);
          },
          child: const Text(
            'Sign Up',
            style: Style.textStyle14,
          ),
        )
      ],
    );
  }
}
