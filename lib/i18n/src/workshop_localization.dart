import 'package:flutter/widgets.dart';

/// Default implementation of the localization.
class WorkshopLocalization {
  /// Helper method to get the localization and listen to changes.
  static WorkshopLocalization of(BuildContext context) {
    return Localizations.of<WorkshopLocalization>(
        context, WorkshopLocalization)!;
  }

  String get loading => 'Loading...';
  String get facilities => 'Facilities';
}

class WorkshopLocalizationNl implements WorkshopLocalization {
  @override
  String get loading => 'Laden...';
  @override
  String get facilities => 'Voorzieningen';
}
