import 'package:flutter/material.dart';
import 'package:pokeflutter/data/api/error_handler.dart';
import 'package:pokeflutter/data/repository/pokemon_repository_impl.dart';
import 'package:pokeflutter/domain/models/pokemon.dart';
import 'package:pokeflutter/domain/models/pokemon_detail.dart';
import 'package:pokeflutter/domain/repository/pokemon_repository.dart';
import 'package:pokeflutter/locator.dart';

class PokemonProvider extends ChangeNotifier {
  PokemonRepository pokemonRepository = serviceLocator<PokemonRepositoryImpl>();

  List<Pokemon> _pokemons;
  List<Pokemon> get pokemons => _pokemons;

  PokemonDetail _pokemonDetail;
  PokemonDetail get pokemonDetail => _pokemonDetail;

  Failure _failure;
  Failure get failure => _failure;

  void fetchPokemons() async {
    try {
      _pokemons = await pokemonRepository.fetchPokemons();
    } catch (e) {
      _failure = e;
    }
    notifyListeners();
  }

  void fetchPokemonDetail(String pokemonUrl) async {
    try {
      _pokemonDetail = await pokemonRepository.fetchPokemonDetail(pokemonUrl);
    } catch (e) {
      _failure = e;
    }
    notifyListeners();
  }
}
