import 'package:flutter/material.dart';
import 'package:pokeflutter/providers/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);

    var usernameController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/pokeball.png', width: 125, height: 125),
            SizedBox(height: 16),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
                hintText: 'username',
              ),
            ),
            SizedBox(height: 32),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
                hintText: 'password',
              ),
            ),
            SizedBox(height: 16),
            loginProvider.isLoading
                ? CircularProgressIndicator()
                : FlatButton(
                    onPressed: () async {
                      final result = await loginProvider.login(
                          usernameController.text.trim(),
                          passwordController.text.trim());
                      if (result) {
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    },
                    child: Text('LOGIN'),
                    color: Colors.red,
                  )
          ],
        ),
      ),
    );
  }
}
