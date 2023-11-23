import 'package:book_store/core/utils/service_locator.dart';
import 'package:book_store/features/Home/data/models/book_model/book_model.dart';
import 'package:book_store/features/Home/data/repos/home_repo_impl.dart';
import 'package:book_store/features/Home/presentation/view_models/similar_book/similar_book_cubit.dart';
import 'package:book_store/features/Splash/presentation/views/spalsh_view.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../constat.dart';
import '../../features/Home/presentation/views/book_details_view.dart';
import '../../features/Home/presentation/views/home_view.dart';
import '../../features/Search/presentation/views/search_view.dart';
 
abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsview = '/BookDetailsView';
  static const kSearchView = '/SearchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: root,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsview,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBookCubit(
            homeRepo: getIt<HomeRepoImpl>(),
          ),
          child: BookDetails(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
