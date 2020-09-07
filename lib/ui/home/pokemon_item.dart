import 'package:flutter/material.dart';
import 'package:pokeflutter/domain/models/pokemon.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonItem({Key key, this.pokemon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          onTap: () =>
              Navigator.pushNamed(context, '/detail', arguments: pokemon),
          child: ListTile(
            title: Text(pokemon.name),
            leading: Hero(
              tag: Key('key' + pokemon.detailUrl),
              child: Image.network(pokemon.image),
            ),
          ),
        ),
      ),
    );
  }
}
