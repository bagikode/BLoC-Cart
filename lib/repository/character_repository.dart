
import 'package:bloc_example_jscarl/models/marvels.dart';
import 'package:bloc_example_jscarl/services/marvel_services.dart';

class CharacterRepository {
  final MarvelServices marvelServices = MarvelServices();

  Future<List<Characters>> fetchCharacters(int offset, int limit) async {
    return await this.marvelServices.getMarvelCharacters(offset, limit);
  }
}