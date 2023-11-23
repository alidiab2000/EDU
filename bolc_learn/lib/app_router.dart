import 'data/models/charaters.dart';
import 'presentation/screens/characterdetail.dart';
import 'business_logic/cubit/charcters_cubit.dart';
import 'constants/strings.dart';
import 'data/repository/characters_repo.dart';
import 'data/web_services/characters_web_services.dart';
import 'presentation/screens/character_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharctersCubit charctersCubit;
  AppRouter() {
    charactersRepository = CharactersRepository(CharatersWebServices());
    charctersCubit = CharctersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charctersCubit,
            child: const CharactersScreen(),
          ),
        );
      case charactersdetailsScreen:
        final character = setting.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharacterDetailsScreen(
            character: character,
          ),
        );
      default:
        return null;
    }
  }
}
