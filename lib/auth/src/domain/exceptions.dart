/// Exception thrown when the user is recognized as unauthorized by the API.
/// Should not be thrown when something goes wrong with the API.
class UnauthorizedException implements Exception {
  final String? message;

  UnauthorizedException([this.message]);
}
