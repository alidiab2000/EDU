import '../../../../../core/widget/custom_error_widget.dart';
import '../../view_models/similar_book/similar_book_cubit.dart';
import '../widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListView extends StatelessWidget {
  const BookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubit, SimilarBookState>(
      builder: (context, state) {
        if (state is SimilarBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: BooKImageItem(
                      book: state.books[index],
                    ));
              },
              itemCount: state.books.length,
            ),
          );
        } else if (state is SimilarBookFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
