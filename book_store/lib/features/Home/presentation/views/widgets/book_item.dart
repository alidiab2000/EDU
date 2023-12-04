import '../../../data/models/book_model/book_model.dart';
import 'custom_book_image.dart';
 import 'package:flutter/material.dart';

class BooKImageItem extends StatelessWidget {
  const BooKImageItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: CustomBookImage(
      book: book,
    ));
  }
}
