import 'package:dio/dio.dart';
import 'package:permissions_app/domain/domian.dart';
import 'package:permissions_app/infrastructure/infrastructure.dart';

class PomkemonsDatasourceImpl implements PokemonsDatasource {
  final Dio dio;
  PomkemonsDatasourceImpl()
    : dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    try {
      final response = await dio.get('/pokemon/$id');
      final pokemon = PokemonMapper.pokeApiToEntityMap(response.data);

      return (pokemon, 'Data obtenida correctamente');
    } catch (e) {
      return (null, 'No se pudo obtener el pokemon $e');
    }
  }
}
