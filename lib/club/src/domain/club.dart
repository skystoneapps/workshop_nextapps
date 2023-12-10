class Club {
  final int id;
  final String name;
  final String description;
  final List<Sport> sports;
  final String? phone;
  final String? email;
  final String? faqUrl;
  final String timezone;
  final List<OpeningHours> openingHours;
  final ApiImageSource mainImage;
  final List<ApiImageSource> images;
  final DateTime? maxNewCourtBookingDate;
  final bool isFavorite;
  final Address address;
  final List<Facility> facilities;

  // 'const' is NOT a keyword for a constructor.
  // It indicates that the constructor can be used to create consts (compile-time constants).
  // Constructors with computed values cannot be used to create compile-time constants.
  const Club({
    required this.id,
    required this.name,
    required this.description,
    required this.mainImage,
    required this.address,

    // Optional parameters, will be null if not provided.
    this.maxNewCourtBookingDate,
    this.faqUrl,
    this.email,
    this.phone,

    // Providing default values for optional parameters.
    this.openingHours = const [],
    this.timezone = 'Europe/Brussels',
    this.images = const [],
    this.sports = const [],
    this.isFavorite = false,
    this.facilities = const [],
  });

  /// A constructor that creates a club from JSON data.
  ///
  /// Depending on architectural perferences, this could be moved to a separate class, a API mapper for example.
  /// There are also libraries that can help with this, such as json_serializable or dart_mappable
  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      // Using a 'tear-off' instead of a lambda here.
      // tear-off: map(getSportFromString)
      // lambda: map((e) => getSportFromString(e))
      sports: List<Sport>.from(
          (json['sports'] as List).map((e) => getSportFromString(e))),
      phone: json['phone'],
      email: json['email'],
      faqUrl: json['faq_url'],
      timezone: json['timezone'],
      openingHours: (json['opening_hours'] as List)
          .map((e) => OpeningHours.fromJson(e))
          .toList(),
      mainImage: ApiImageSource.fromJson(json['main_image']),
      images: (json['images'] as List)
          .map((e) => ApiImageSource.fromJson(e))
          .toList(),
      maxNewCourtBookingDate: json['max_new_court_booking_date'] != null
          ? DateTime.parse(json['max_new_court_booking_date'])
          : null,
      isFavorite: json['is_favorite'],
      address: Address.fromJson(json['address']),
      facilities: (json['facilities'] as List)
          .map((e) => Facility.fromJson(e))
          .toList(),
    );
  }
}

class OpeningHours {
  final String day;
  final String openingTime;
  final String closingTime;

  const OpeningHours({
    required this.day,
    required this.openingTime,
    required this.closingTime,
  });

  factory OpeningHours.fromJson(Map<String, dynamic> json) {
    return OpeningHours(
      day: json['day'],
      openingTime: json['opening_time'],
      closingTime: json['closing_time'],
    );
  }
}

class Address {
  final int id;
  final Coordinates coordinates;
  final String street;
  final String number;
  final String? boxNumber;
  final String zipcode;
  final String city;
  final Country country;

  const Address({
    required this.id,
    required this.coordinates,
    required this.street,
    required this.number,
    this.boxNumber,
    required this.zipcode,
    required this.city,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      coordinates: Coordinates.fromJson(json['coordinates']),
      street: json['street'],
      number: json['number'],
      boxNumber: json['box_number'],
      zipcode: json['zipcode'],
      city: json['city'],
      country: Country.fromJson(json['country']),
    );
  }
}

class Coordinates {
  final double latitude;
  final double longitude;

  const Coordinates({required this.latitude, required this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class Country {
  final int id;
  final String code;

  const Country({required this.id, required this.code});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      code: json['code'],
    );
  }
}

class Facility {
  final int id;
  final String name;
  final ApiImageSource icon;

  const Facility({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      id: json['id'],
      name: json['name'],
      icon: ApiImageSource.fromJson(json['icon']),
    );
  }
}

class ApiImageSource {
  final String original;
  final String medium;
  final String small;

  const ApiImageSource({
    required this.original,
    required this.medium,
    required this.small,
  });

  factory ApiImageSource.fromJson(Map<String, dynamic> json) {
    return ApiImageSource(
      original: json['original'],
      medium: json['medium'],
      small: json['small'],
    );
  }
}

enum Sport {
  soccer5,
  padbol,
  padel,
  tennis,
  squash,
}

Sport getSportFromString(String sport) {
  return switch (sport) {
    'soccer5' => Sport.soccer5,
    'padbol' => Sport.padbol,
    'padel' => Sport.padel,
    'tennis' => Sport.tennis,
    'squash' => Sport.squash,
    _ => throw Exception('Unknown sport: $sport'),
  };
}
