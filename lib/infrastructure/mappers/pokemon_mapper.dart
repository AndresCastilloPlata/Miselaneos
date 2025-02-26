import 'package:permissions_app/domain/domian.dart';
import 'package:permissions_app/infrastructure/infrastructure.dart';

class PokemonMapper {
  static Pokemon pokeApiToEntityMap(Map<String, dynamic> json) {
    final pokeApiPokemon = PokeApiResponse.fromJson(json);
    return Pokemon(
      id: pokeApiPokemon.id,
      name: pokeApiPokemon.name,
      spriteFront: pokeApiPokemon.sprites.frontDefault,
    );
  }
}
