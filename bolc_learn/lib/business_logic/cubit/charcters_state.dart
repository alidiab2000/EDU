part of 'charcters_cubit.dart';

@immutable
sealed class CharctersState {}  //Or abstract class

final class CharctersInitial extends CharctersState {}

class CharactersLoaded extends CharctersState {
  final List<Character> characters;
  CharactersLoaded({required this.characters});
}
