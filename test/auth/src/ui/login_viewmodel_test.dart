import 'package:flutter_test/flutter_test.dart';
import 'package:workshop_nextapps/auth/src/ui/login_viewmodel.dart';

void main() {
  group('LoginViewModel', () {
    // TODO setup dependencies
    late LoginViewModel viewModel;

    test('Valid credentials should result into a successful login', () async {
      bool callbackCalled = false;
      callback() {
        callbackCalled = true;
      }

      viewModel = LoginViewModel(onLoginSuccess: callback);
      final result = await viewModel.login(email: 'test', password: 'test');

      expect(result, true);
      expect(callbackCalled, true);
    });

    test('Invalid credentials should emit an error state', () async {
      viewModel = LoginViewModel(onLoginSuccess: () {});

      expectLater(
          viewModel.loginStateStream,
          emitsInOrder([
            isA<LoginIdle>(),
            isA<LoginLoading>(),
            isA<LoginError>(),
          ]));

      await viewModel.login(email: 'test', password: 'invalid');

      expect(viewModel.loginState, isA<LoginError>());
    });
  });
}
