import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permissions_app/Config/config.dart';
import 'package:permissions_app/domain/domian.dart';
import 'package:permissions_app/presentation/providers/providers.dart';

class PokemonScreen extends ConsumerWidget {
  final String pokemonId;

  const PokemonScreen({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));
    return pokemonAsync.when(
      data: (pokemon) => _PokemonView(pokemon: pokemon),
      error: (error, stackTrace) => _ErrorWidget(message: error.toString()),
      loading: () => _LoadingWidget(),
    );
  }
}

class _PokemonView extends StatelessWidget {
  final Pokemon pokemon;
  const _PokemonView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        actions: [
          IconButton(
            onPressed: () {
              SharePlugin.shareLink(
                'https://deep-linking-flutter-pokemon-production.up.railway.app/pokemons/${pokemon.id}',
                'Mira este pókemon',
              );
            },
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: Center(
        child: Image.network(
          pokemon.spriteFront,
          fit: BoxFit.contain,
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String message;
  const _ErrorWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(message)));
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: const CircularProgressIndicator()));
  }
}
