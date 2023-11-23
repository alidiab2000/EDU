// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:book_store/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
  });
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: Style.textStyle14,
      textAlign: TextAlign.center,
    );
  }
}
