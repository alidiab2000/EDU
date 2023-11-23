import '../models/charaters.dart';
import '../web_services/characters_web_services.dart';

class CharactersRepository {
  final CharatersWebServices charatersWebServices;
  CharactersRepository(this.charatersWebServices);

  Future<List<Character>> getAllCharaters() async {
    final characters = await charatersWebServices.getAllCharaters();
    return characters
        .map(
          (character) => Character.fromjson(character),
        )
        .toList();
  }
}
