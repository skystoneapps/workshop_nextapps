import 'package:get_it/get_it.dart';

import '../club/src/data/club_api.dart';

final GetIt locator = GetIt.asNewInstance();

void setupDependencies() {
  locator.registerLazySingleton<ClubApi>(() => FakeClubApi());
  // locator.registerLazySingleton<ClubApi>(() => ClubApi());
}
