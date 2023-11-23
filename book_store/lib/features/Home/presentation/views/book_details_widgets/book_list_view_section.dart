import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';
import 'books_list_view.dart';

class BooksListViewSection extends StatelessWidget {
  const BooksListViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'You can also like',
          style: Style.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const BookListView(),
      ],
    );
  }
}
