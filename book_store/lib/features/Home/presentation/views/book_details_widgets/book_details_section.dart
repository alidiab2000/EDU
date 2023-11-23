// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:book_store/features/Home/data/models/book_model/book_model.dart';
import 'package:book_store/features/Home/presentation/views/widgets/book_item.dart';

import '../../../../../core/utils/style.dart';
import '../widgets/book_rating.dart';

class BookDetailsSectuion extends StatelessWidget {
  const BookDetailsSectuion({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: BooKImageItem(
            book: bookModel,
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookModel.volumeInfo.title!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Style.textStyle30,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          bookModel.volumeInfo.description ?? "Description",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Style.textStyle18.copyWith(
            color: Colors.grey.withOpacity(0.8),
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const BookRating(
          rating: "10",
          count: 10,
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ],
    );
  }
}
