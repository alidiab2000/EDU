import 'package:book_store/constat.dart';
import 'package:book_store/core/utils/bloc_obs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/Home/data/repos/home_repo_impl.dart';
import 'features/Home/presentation/view_models/featured_books_cuibt/featured_books_cubit.dart';
import 'features/Home/presentation/view_models/newset_books/newset_books_cubit.dart';

void main() {
  setUpServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const BooklyStore());
}

class BooklyStore extends StatelessWidget {
  const BooklyStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => FeaturedBooksCubit(
            getIt<HomeRepoImpl>(),
          )..fetchFraturedBooks(),
        ),
        BlocProvider(
          create: (_) => NewsetBooksCubit(
            getIt<HomeRepoImpl>(),
          )..fetchNewsetBooks(),
        ),
      ],
      child: MaterialApp.router(
        title: "Bookly Store",
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
