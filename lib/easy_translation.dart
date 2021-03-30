import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart';

class EasyTranslation {
  Map<String, String> _localizedStrings;

  static const LocalizationsDelegate<EasyTranslation> delegate =
      _EasyTranslationDelegate();

  static EasyTranslation of(BuildContext context) {
    return Localizations.of<EasyTranslation>(context, EasyTranslation);
  }

  Future<void> _loadLocale() async {
    Locale _locale = await _getDeviceLocale();
    String jsonString =
        await rootBundle.loadString('language/${_locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  Future<Locale> _getDeviceLocale() async {
    final _deviceLocale = await findSystemLocale();
    final _splittedLocale = _deviceLocale.split("_");
    final _deviceLanguageCode = _splittedLocale[0];
    final _deviceCountry = _splittedLocale[1];
    return new Locale(_deviceLanguageCode, _deviceCountry);
  }

  String translate(String key) {
    return _localizedStrings[key];
  }
}

class _EasyTranslationDelegate extends LocalizationsDelegate<EasyTranslation> {
  const _EasyTranslationDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'sk', 'fr', 'es', 'it'].contains(locale.languageCode);
  }

  @override
  Future<EasyTranslation> load(Locale locale) async {
    EasyTranslation translations = new EasyTranslation();
    await translations._loadLocale();
    return translations;
  }

  @override
  bool shouldReload(_EasyTranslationDelegate old) => false;
}
