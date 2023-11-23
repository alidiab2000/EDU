import 'package:book_store/features/Home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/style.dart';
import 'custom_app_bar.dart';
import 'featured_list_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              FeaturedListView(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                child: Text(
                  'Newset Books',
                  style: Style.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        BestSellerSliverListView(),
      ],
    );
  }
}
