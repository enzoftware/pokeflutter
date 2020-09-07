import 'dart:io';

import 'package:pokeflutter/data/api/error_handler.dart';
import 'package:pokeflutter/data/api/pokemon_api.dart';
import 'package:pokeflutter/domain/models/pokemon.dart';
import 'package:pokeflutter/domain/models/pokemon_detail.dart';
import 'package:pokeflutter/domain/repository/pokemon_repository.dart';
import 'package:pokeflutter/locator.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  @override
  Future<List<Pokemon>> fetchPokemons() {
    try {
      var api = serviceLocator<PokemonApi>();
      return api.fetchPokemons();
    } on SocketException {
      throw Failure('No internet connection', 400);
    } on HttpException {
      throw Failure('Not found request', 404);
    } on FormatException {
      throw Failure('Invalid JSON format', 422);
    } catch (e) {
      throw Failure(e.toString(), 888);
    }
  }

  @override
  Future<PokemonDetail> fetchPokemonDetail(String pokemonDetailUrl) {
    try {
      var api = serviceLocator<PokemonApi>();
      return api.fetchPokemonDetail(pokemonDetailUrl);
    } on SocketException {
      throw Failure('No internet connection', 400);
    } on HttpException {
      throw Failure('Not found request', 404);
    } on FormatException {
      throw Failure('Invalid JSON format', 422);
    } catch (e) {
      throw Failure(e.toString(), 888);
    }
  }
}
