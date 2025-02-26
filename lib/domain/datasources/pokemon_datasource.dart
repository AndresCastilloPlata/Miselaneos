import 'package:permissions_app/domain/domian.dart';

abstract class PokemonsDatasource {
  Future<(Pokemon?, String)> getPokemon(String id);
}
