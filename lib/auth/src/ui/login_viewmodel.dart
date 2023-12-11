import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/auth_service.dart';

class LoginViewModel {
  final AuthService _authService = AuthService();

  final VoidCallback onLoginSuccess;

  LoginState _loginState = LoginIdle();
  StreamController<LoginState> _loginStateController =
      StreamController<LoginState>();

  LoginViewModel({required this.onLoginSuccess}) {
    _loginStateController.add(_loginState);
  }

  LoginState get loginState => _loginState;
  Stream<LoginState> get loginStateStream => _loginStateController.stream;

  void _setLoginState(LoginState state) {
    _loginState = state;
    _loginStateController.add(state);
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      _setLoginState(LoginLoading());
      final success =
          await _authService.login(username: email, password: password);
      if (success) {
        _setLoginState(LoginIdle());
        onLoginSuccess();
      } else {
        _setLoginState(LoginError('Invalid credentials'));
      }
      return success;
    } catch (e) {
      print('Unable to login: $e');
      rethrow;
    }
  }

  void dispose() {
    _loginStateController.close();
  }
}

class LoginViewModelProvider extends StatelessWidget {
  final VoidCallback onLoginSuccess;
  final Widget child;

  const LoginViewModelProvider({
    super.key,
    required this.onLoginSuccess,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Provider<LoginViewModel>(
      create: (context) => LoginViewModel(onLoginSuccess: onLoginSuccess),
      dispose: (_, viewModel) => viewModel.dispose(),
      child: child,
    );
  }
}

/// A sealed class only allows a fixed set of subclasses.
/// This is useful for using switch statements, because the compiler
/// can check if all cases are handled.
sealed class LoginState {}

class LoginLoading extends LoginState {}

class LoginIdle extends LoginState {}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}
