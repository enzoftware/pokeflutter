import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokeflutter/providers/login_provider.dart';
import 'package:pokeflutter/providers/pokemon_provider.dart';
import 'package:pokeflutter/ui/details/details_screen.dart';
import 'package:pokeflutter/ui/home/home_screen.dart';
import 'package:pokeflutter/ui/login/login_screen.dart';
import 'package:pokeflutter/ui/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';

import 'locator.dart';

void main() async {
  await Hive.initFlutter();
  setupDependencies();
  runApp(PokemonFlutterApp());
}

class PokemonFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => PokemonProvider())
      ],
      child: MaterialApp(
        title: 'PokemonFlutter App',
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          '/board': (context) => OnBoardingScreen(),
          '/detail': (context) => PokemonDetailScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: StartUpScreen(),
      ),
    );
  }
}

class StartUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _getStartupScreen(context);
    return Scaffold(body: Center(child: Image.asset('assets/pokeball.png')));
  }

  Future _getStartupScreen(BuildContext context) async {
    var hasLogin = await Hive.openBox('login');
    var isFirstTime = await Hive.openBox('onboarding');
    if (isFirstTime.get('firstTime', defaultValue: true)) {
      Navigator.pushReplacementNamed(context, '/board');
      return;
    }
    if (hasLogin.get('token', defaultValue: 'no_token') == 'no_token') {
      Navigator.pushReplacementNamed(context, '/login');
      return;
    }
    Navigator.pushReplacementNamed(context, '/home');
  }
}
