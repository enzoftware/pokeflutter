import 'package:pokeflutter/domain/models/pokemon.dart';
import 'package:pokeflutter/domain/models/pokemon_detail.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> fetchPokemons();
  Future<PokemonDetail> fetchPokemonDetail(String pokemonDetailUrl);
}
