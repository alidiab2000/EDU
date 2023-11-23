import 'package:book_store/core/widget/custom_error_widget.dart';
import 'package:book_store/core/widget/custom_loading_indecator.dart';
import 'package:book_store/features/Home/presentation/view_models/newset_books/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Home/presentation/views/widgets/best_seller_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
            builder: (context, state) {
              if (state is NewsetBooksSuccess) {
                return BestSellerItem(
                  book: state.books[index],
                );
              } else if (state is NewsetBooksFailure) {
                return CustomErrorWidget(errorMessage: state.errorMessage);
              } else {
                return const CustomLoadingIndecator();
              }
            },
          );
        },
        itemCount: 10,
      ),
    );
  }
}
