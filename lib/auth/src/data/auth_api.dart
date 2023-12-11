import 'package:workshop_nextapps/auth/src/domain/exceptions.dart';

import '../domain/models.dart';

class AuthApi {
  Future<AuthTokens> loginWithCredentials({
    required String username,
    required String password,
  }) async {
    throw UnimplementedError('No API implemented yet');
  }
}

class FakeAuthApi implements AuthApi {
  @override
  Future<AuthTokens> loginWithCredentials({
    required String username,
    required String password,
  }) async {
    if (username != 'test' || password != 'test') {
      throw UnauthorizedException('Invalid credentials provided at login');
    }
    await Future.delayed(Duration(seconds: 1));
    return AuthTokens(
      accessToken: 'access_token',
      refreshToken: 'refresh_token',
    );
  }
}
