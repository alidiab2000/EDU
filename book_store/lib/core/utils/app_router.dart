import 'service_locator.dart';
import '../../features/Home/data/models/book_model/book_model.dart';
import '../../features/Home/data/repos/home_repo_impl.dart';
import '../../features/Home/presentation/view_models/similar_book/similar_book_cubit.dart';
import '../../features/Splash/presentation/views/spalsh_view.dart';
import '../../features/auth/data/authcubit/auth_cubit.dart';
import '../../features/auth/views/login_view.dart';
import '../../features/auth/views/register_view.dart';
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
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';
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
      GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const RegisterView(),
        ),
      ),
    ],
  );
}
