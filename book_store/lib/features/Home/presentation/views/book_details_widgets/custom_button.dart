// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.white,
    required this.text,
    required this.borderRadius,
    this.onPressed,
  });

  final Color backgroundColor;
  final Color textColor;
  final String text;
  final BorderRadius borderRadius;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
          child: Text(
            text,
            style: Style.textStyle14.copyWith(
              color: textColor,
              fontWeight: FontWeight.w900,
            ),
          )),
    );
  }
}
