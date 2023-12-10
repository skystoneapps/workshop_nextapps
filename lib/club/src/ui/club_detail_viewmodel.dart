import 'package:flutter/material.dart';
import 'package:workshop_nextapps/club/src/data/club_api.dart';
import 'package:workshop_nextapps/club/src/domain/club.dart';

class ClubDetailViewModel extends ChangeNotifier {
  final int clubId;
  final ClubApi _clubApi;

  bool _isLoading = false;
  Club? _club;

  /// Indicates whether the data is currently being fetched.
  bool get isLoading => _isLoading;

  /// The name of the club. Will be null if the data is not yet fetched.
  String? get name => _club?.name;

  /// A constructor with named parameters.
  /// `clubApi` is optional and will default to a new instance of `ClubApi`.
  /// This is defined in the constructor's "initializer list".
  /// It's important to know the order of execution of the constructor:
  /// 1. values are assigned to instance variables (e.g. `clubId = clubId`)
  /// 2. the initializer list is executed
  /// 3. the super constructor is called (not applicable here)
  /// 4. the constructor body is executed, with access to the instance variables.
  ///   The instance is already created before the constructor body is executed.
  ClubDetailViewModel({
    required this.clubId,
    ClubApi? clubApi,
  }) : _clubApi = clubApi ?? ClubApi() {
    _fetchData(clubId);
  }

  Future<void> _fetchData(int clubId) async {
    try {
      _isLoading = true;
      notifyListeners();
      _club = await _clubApi.getClub(clubId);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
