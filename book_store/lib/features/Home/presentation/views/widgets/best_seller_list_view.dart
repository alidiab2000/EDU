import 'package:book_store/core/widget/custom_error_widget.dart';
import 'package:book_store/core/widget/custom_loading_indecator.dart';
import 'package:book_store/features/Home/presentation/view_models/newset_books/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_item.dart';

class BestSellerSliverListView extends StatelessWidget {
  const BestSellerSliverListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
              builder: (context, state) {
                if (state is NewsetBooksSuccess) {
                  return BestSellerItem(
                    book:
                        state.books[index] 
                  );
                } else if (state is NewsetBooksFailure) {
                  return CustomErrorWidget(errorMessage: state.errorMessage);
                } else {
                  return const CustomLoadingIndecator();
                }
              },
            ),
          );
        },
        childCount: 10,
      ),
    );
  }
}
