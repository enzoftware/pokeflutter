import 'package:pokeflutter/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<String> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value("JWT_TOKEN_OR_ANOTHER_IDENTIFIER_VALUE");
  }
}
