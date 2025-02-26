import 'package:flutter/material.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PokemonsView());
  }
}

class PokemonsView extends StatefulWidget {
  const PokemonsView({super.key});

  @override
  State<PokemonsView> createState() => _PokemonsViewState();
}

class _PokemonsViewState extends State<PokemonsView> {
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      //todo: controller
      slivers: [
        SliverAppBar(
          title: const Text('Pokemons'),
          floating: true,
          backgroundColor: Colors.white.withAlpha((0.8 * 255).round()),
        ),
      ],
    );
  }
}
