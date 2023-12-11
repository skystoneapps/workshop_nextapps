import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginViewModelProvider(
      onLoginSuccess: () => print('success'),
      child: _LoginScreenContent(),
    );
  }
}

class _LoginScreenContent extends StatelessWidget {
  const _LoginScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final viewModel =
                    Provider.of<LoginViewModel>(context, listen: false);
                viewModel.login(email: 'email', password: 'password');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
