import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:workshop_nextapps/i18n/src/supported_locales.dart';

import 'workshop_localization.dart';

class WorkshopLocalizationDelegate
    extends LocalizationsDelegate<WorkshopLocalization> {
  const WorkshopLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    /// Check if the locale is supported, based on the language code.
    return supportedLocales
        .map((locale) => locale.languageCode)
        .contains(locale.languageCode);
  }

  @override
  Future<WorkshopLocalization> load(Locale locale) {
    final lang = locale.languageCode;
    final localization = switch (lang) {
      'nl' => WorkshopLocalizationNl(),
      _ => WorkshopLocalization(),
    };
    return SynchronousFuture<WorkshopLocalization>(localization);
  }

  @override
  bool shouldReload(LocalizationsDelegate<WorkshopLocalization> old) {
    return false;
  }
}
