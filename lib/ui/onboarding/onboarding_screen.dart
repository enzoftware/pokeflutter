import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pokeflutter/ui/onboarding/onboarding_model.dart';
import 'package:pokeflutter/ui/onboarding/onboarding_pages.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPages(
        bgColor: Colors.white,
        themeColor: const Color(0xFFf74269),
        pages: pages,
        skipClicked: (value) {
          goToLoginScreen();
        },
        getStartedClicked: (value) {
          goToLoginScreen();
        },
      ),
    );
  }

  void goToLoginScreen() async {
    Navigator.pushReplacementNamed(context, '/login');
    var box = await Hive.openBox('onboarding');
    box.put('firstTime', false);
  }

  final pages = [
    OnboardingModel(
      title: 'Choose your item',
      description:
          'Easily find your grocery items and you will get delivery in wide range',
      titleColor: Colors.black,
      descripColor: const Color(0xFF929794),
      imagePath: 'assets/intro1.jpg',
    ),
    OnboardingModel(
      title: 'Pick Up or Delivery',
      description:
          'We make ordering fast, simple and free-no matter if you order online or cash',
      titleColor: Colors.black,
      descripColor: const Color(0xFF929794),
      imagePath: 'assets/pokemon_error.jpg',
    ),
    OnboardingModel(
      title: 'Pay quick and easy',
      description: 'Pay for order using credit or debit card',
      titleColor: Colors.black,
      descripColor: const Color(0xFF929794),
      imagePath: 'assets/pokeball.png',
    ),
  ];
}
