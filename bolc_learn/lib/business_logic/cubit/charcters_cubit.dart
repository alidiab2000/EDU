// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:bolc_learn/data/models/charaters.dart';
import 'package:bolc_learn/data/repository/characters_repo.dart';
import 'package:meta/meta.dart';

part 'charcters_state.dart';

class CharctersCubit extends Cubit<CharctersState> {
  final CharactersRepository charactersRepository;
    List<Character> charaters =[];

  CharctersCubit(
    this.charactersRepository,
  ) : super(CharctersInitial());
  
  List<Character> getAllCharaters() {
    charactersRepository.getAllCharaters().then((characters) {
      emit(CharactersLoaded(characters: characters)); // equal setstate
      charaters = characters;
    });
    return charaters;
  }
} 