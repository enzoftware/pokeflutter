import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokeflutter/domain/models/pokemon.dart';
import 'package:pokeflutter/domain/models/pokemon_detail.dart';

class PokemonApi {
  var client = http.Client();

  final POKEMON_FETCH_LIMIT = 100;

  Future<List<Pokemon>> fetchPokemons() async {
    final data = await client
        .get('https://pokeapi.co/api/v2/pokemon?limit=$POKEMON_FETCH_LIMIT');
    final response = json.decode(data.body);
    return [for (var pokemon in response['results']) Pokemon.fromJson(pokemon)];
  }

  Future<PokemonDetail> fetchPokemonDetail(String pokemonUrl) async {
    final data = await client.get(pokemonUrl);
    final response = json.decode(data.body);
    return PokemonDetail.fromJson(response);
  }
}
