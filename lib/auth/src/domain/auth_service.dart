import 'package:workshop_nextapps/auth/src/domain/exceptions.dart';

import '../data/auth_api.dart';

class AuthService {
  // TODO inject dependencies
  final AuthApi authApi = FakeAuthApi();

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    try {
      final tokens = await authApi.loginWithCredentials(
        username: username,
        password: password,
      );
      // TODO store tokens, fetch user data, etc.
      return true;
    } on UnauthorizedException catch (e) {
      print('Invalid credentials: $e');
      return false;
    } catch (e) {
      print('Something went wrong: $e');
      // TODO handle other exceptions, maybe log the error to a crash reporter
      rethrow;
    }
  }
}
