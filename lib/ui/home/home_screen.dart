import 'package:flutter/material.dart';
import 'package:pokeflutter/providers/pokemon_provider.dart';
import 'package:pokeflutter/ui/home/pokemon_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemons'),
      ),
      body: PokemonListBody(),
    );
  }
}

class PokemonListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonProvider>(context)
      ..fetchPokemons();
    if (pokemonProvider.failure != null) {
      return Center(child: Text(pokemonProvider.failure.toString()));
    }
    if (pokemonProvider.pokemons == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: pokemonProvider.pokemons.length,
              itemBuilder: (_, index) => PokemonItem(
                pokemon: pokemonProvider.pokemons[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
