import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        // horizontal: 24,
        vertical: 35,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Image.asset(
              AssetsData.logo,
              height: 16,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 24,
            ),
            onPressed: () {
              debugPrint('seaerch  icon');
              GoRouter.of(context).push(AppRouter.kSearchView);
            },
          )
        ],
      ),
    );
  }
}
