import 'package:permissions_app/domain/domian.dart';
import 'package:permissions_app/infrastructure/infrastructure.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsDatasource datasource;

  PokemonsRepositoryImpl({PokemonsDatasource? datasource})
    : datasource = datasource ?? PomkemonsDatasourceImpl();

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    return datasource.getPokemon(id);
  }
}
