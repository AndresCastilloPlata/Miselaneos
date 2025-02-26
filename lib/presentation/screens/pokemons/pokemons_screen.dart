import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permissions_app/presentation/providers/providers.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PokemonsView());
  }
}

class PokemonsView extends ConsumerStatefulWidget {
  const PokemonsView({super.key});

  @override
  PokemonsViewState createState() => PokemonsViewState();
}

class PokemonsViewState extends ConsumerState<PokemonsView> {
  final scrollController = ScrollController();

  void infinitScroll() {
    final currentPokemons = ref.read(pokemonIdsProvider);
    if (currentPokemons.length > 400) {
      scrollController.removeListener(infinitScroll);
      return;
    }

    if ((scrollController.position.pixels + 200) >
        scrollController.position.maxScrollExtent) {
      ref
          .read(pokemonIdsProvider.notifier)
          .update(
            (state) => [
              ...state,
              ...List.generate(30, (index) => state.length + index + 1),
            ],
          );
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(infinitScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          title: const Text('Pokemons'),
          floating: true,
          backgroundColor: Colors.white.withAlpha((0.8 * 255).round()),
        ),
        _PokemonGrid(),
      ],
    );
  }
}

class _PokemonGrid extends ConsumerWidget {
  const _PokemonGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonIds = ref.watch(pokemonIdsProvider);

    return SliverGrid.builder(
      itemCount: pokemonIds.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return Image.network(
          //todo: ontap
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
          fit: BoxFit.contain,
        );
      },
    );
  }
}
