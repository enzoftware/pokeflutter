import 'package:get_it/get_it.dart';
import 'package:pokeflutter/data/api/pokemon_api.dart';
import 'package:pokeflutter/data/repository/login_repository_impl.dart';
import 'package:pokeflutter/data/repository/pokemon_repository_impl.dart';

GetIt serviceLocator = GetIt.instance;

void setupDependencies() {
  serviceLocator.registerLazySingleton(() => LoginRepositoryImpl());

  serviceLocator.registerLazySingleton(() => PokemonRepositoryImpl());

  serviceLocator.registerLazySingleton(() => PokemonApi());
}
