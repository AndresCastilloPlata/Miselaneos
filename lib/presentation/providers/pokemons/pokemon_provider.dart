import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permissions_app/domain/domian.dart';
import 'package:permissions_app/infrastructure/infrastructure.dart';

final pokemonsRepositoryProvider = Provider<PokemonsRepository>((ref) {
  return PokemonsRepositoryImpl();
});

final pokemonProvider = FutureProvider.family<Pokemon, String>((ref, id) async {
  final pokemonRepository = ref.watch(pokemonsRepositoryProvider);

  final (pokemon, error) = await pokemonRepository.getPokemon(id);

  if (pokemon != null) return pokemon;

  throw error;
});
