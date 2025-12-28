import 'package:flutter/material.dart';

/// Provider for managing app locale state.
///
/// Uses ChangeNotifier to notify listeners when locale changes.
class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('tr');

  /// Current app locale.
  Locale get locale => _locale;

  /// Changes the app locale.
  ///
  /// Notifies all listeners after locale change.
  void setLocale(Locale locale) {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
  }

  /// Clears the locale preference.
  void clearLocale() {
    _locale = const Locale('tr');
    notifyListeners();
  }
}
