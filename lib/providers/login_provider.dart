import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pokeflutter/data/api/error_handler.dart';
import 'package:pokeflutter/data/repository/login_repository_impl.dart';
import 'package:pokeflutter/locator.dart';

class LoginProvider extends ChangeNotifier {
  final _loginRepository = serviceLocator<LoginRepositoryImpl>();

  bool isLoading = false;

  Failure _failure;
  Failure get failure => _failure;

  Future<bool> login(String username, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      var loginResult = await _loginRepository.login(username, password);
      if (loginResult != null && loginResult.isNotEmpty) {
        var box = await Hive.openBox('login');
        box.put('token', loginResult);
      }
      isLoading = false;
      notifyListeners();
      return true;
    } on Failure catch (e) {
      _failure = e;
      return false;
    }
  }
}
