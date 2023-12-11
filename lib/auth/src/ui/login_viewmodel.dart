import '../domain/auth_service.dart';

class LoginViewModel {
  final AuthService _authService = AuthService();

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final success = _authService.login(username: email, password: password);
      // Different ways to handle the result
      return success;
    } catch (e) {
      print('Unable to login: $e');
      rethrow;
    }
  }
}
