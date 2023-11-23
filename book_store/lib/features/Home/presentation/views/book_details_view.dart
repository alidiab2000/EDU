// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:book_store/features/Home/data/models/book_model/book_model.dart';
import 'package:book_store/features/Home/presentation/view_models/similar_book/similar_book_cubit.dart';

import 'book_details_widgets/book_details_body.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  void initState() {
    BlocProvider.of<SimilarBookCubit>(context).fetchRecommendedBooks(
        category: widget.bookModel.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsBody(
          bookModel: widget.bookModel,
        ),
      ),
    );
  }
}
