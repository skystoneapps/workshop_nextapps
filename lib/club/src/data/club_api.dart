import 'dart:convert';
import 'package:http/http.dart' as http;

import '../domain/club.dart';

class ClubApi {
  static const String _baseUrl = "api.arenal.be";
  // static const String _baseUrl = "staging-api.arenal.be";

  static Uri _getClubUri(int id) => Uri.https(_baseUrl, "/api/club/$id");
  static Uri _getClubsUri() => Uri.https(_baseUrl, "/api/clubs");

  /// Fetches a single club from the API.
  Future<Club> getClub(int id) async {
    final response = await http.get(
      _getClubUri(id),
      headers: {
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = json['data'];
      return Club.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  /// Fetches all clubs from the API.
  Future<List<Club>> getClubs() async {
    final response = await http.get(
      _getClubsUri(),
      headers: {
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = json['data'] as List;
      return data.map((e) => Club.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

/// A fake implementation of the ClubApi.
///
/// This is useful for testing purposes.
/// Note that a concrete class can be implemented without the need for an abstract class.
class FakeClubApi implements ClubApi {
  @override
  Future<Club> getClub(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    return _fakeClub1;
  }

  @override
  Future<List<Club>> getClubs() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      _fakeClub1,
    ];
  }

  static Club _fakeClub1 = Club(
    id: 1,
    name: "Fake Club",
    description:
        "This is not a real club. This is a mocked result from the FakeClubApi.",
    mainImage: ApiImageSource(
      original: "https://picsum.photos/seed/sport/600/400",
      small: "https://picsum.photos/seed/sport/150/100",
      medium: "https://picsum.photos/seed/sport/300/200",
    ),
    maxNewCourtBookingDate: DateTime(2024, 2, 1),
    address: Address(
      id: 1,
      coordinates: Coordinates(
        latitude: 50.0,
        longitude: 4.0,
      ),
      street: "Rue de la rue",
      number: "1",
      zipcode: "1000",
      city: "Bruxelles",
      country: Country(
        id: 1,
        code: "BE",
      ),
    ),
    facilities: [
      Facility(
        id: 1,
        name: "Material rental",
        icon: ApiImageSource(
          original: "https://picsum.photos/seed/racket-icon/144/144",
          small: "https://picsum.photos/seed/racket-icon/36/36",
          medium: "https://picsum.photos/seed/racket-icon/72/72",
        ),
      ),
      Facility(
        id: 2,
        name: "Bar",
        icon: ApiImageSource(
          original: "https://picsum.photos/seed/bar-icon/144/144",
          small: "https://picsum.photos/seed/bar-icon/36/36",
          medium: "https://picsum.photos/seed/bar-icon/72/72",
        ),
      ),
    ],
    openingHours: [
      OpeningHours(
        day: "monday",
        openingTime: "08:00",
        closingTime: "22:00",
      ),
      OpeningHours(
        day: "tuesday",
        openingTime: "08:00",
        closingTime: "22:00",
      ),
      OpeningHours(
        day: "wednesday",
        openingTime: "08:00",
        closingTime: "22:00",
      ),
    ],
  );
}
