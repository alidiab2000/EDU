// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:book_store/features/Home/data/models/book_model/book_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButton(
                onPressed: () async {
                  final Uri url = Uri.parse(bookModel.volumeInfo.previewLink!);
                  if (await canLaunchUrl(url)) {
                    throw Exception('Could not launch $url');
                  } else {
                    await launchUrl(url);
                  }
                },
                text: "Free",
                textColor: Colors.black,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )),
          ),
          Expanded(
            child: CustomButton(
                onPressed: () {},
                text: "Preview",
                backgroundColor: const Color(0xffEF8262),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
          ),
        ],
      ),
    );
  }
}
