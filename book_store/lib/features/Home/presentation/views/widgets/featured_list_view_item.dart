import '../../../../../core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widget/custom_error_widget.dart';
import '../../view_models/featured_books_cuibt/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kBookDetailsview,
                            extra: state.bookModel[index]);
                      },
                      child: BooKImageItem(
                        book: state.bookModel[index],
                      ),
                    ),
                  );
                },
                itemCount: state.bookModel.length,
              ),
            );
          } else if (state is FeaturedBooksFailuer) {
            return CustomErrorWidget(errorMessage: state.errorMessage);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
