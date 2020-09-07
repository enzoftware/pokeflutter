import 'package:flutter/material.dart';
import 'package:pokeflutter/domain/models/pokemon.dart';
import 'package:pokeflutter/providers/pokemon_provider.dart';
import 'package:pokeflutter/ui/details/type_item.dart';
import 'package:provider/provider.dart';

class PokemonDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pokemon args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(args.name)),
      body: Column(
        children: [
          Hero(
            tag: Key('key' + args.detailUrl),
            child: Container(
              height: MediaQuery.of(context).size.height * .45,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(args.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(child: PokemonDetailBody(pokemon: args)),
        ],
      ),
    );
  }
}

class PokemonDetailBody extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailBody({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonProvider>(context)
      ..fetchPokemonDetail(pokemon.detailUrl);

    if (pokemonProvider.failure != null) {
      return Center(child: Text(pokemonProvider.failure.toString()));
    }

    if (pokemonProvider.pokemonDetail == null ||
        pokemonProvider.pokemonDetail.id != pokemon.id) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView(
      children: [
        ListTile(
          title: Text('Weight'),
          subtitle: Text(pokemonProvider.pokemonDetail.weight.toString()),
        ),
        ListTile(
          title: Text('Height'),
          subtitle: Text(pokemonProvider.pokemonDetail.height.toString()),
        ),
        ListTile(
          title: Text('Base experience'),
          subtitle:
              Text(pokemonProvider.pokemonDetail.baseExperience.toString()),
        ),
        ListTile(
            title: Text('Types'),
            subtitle: Row(
              children: pokemonProvider.pokemonDetail.types
                  .map((type) => PokemonTypeItem(name: type.name))
                  .toList(),
            )),
      ],
    );
  }
}
