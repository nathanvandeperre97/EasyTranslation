import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:convert';
import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart';

List<Locale> appLocales = [
  Locale('en', 'US'),
];

const easyTranslationDelegates = [
  EasyTranslation.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];

class EasyTranslation {
  static const LocalizationsDelegate<EasyTranslation> delegate =
      _EasyTranslationDelegate();

  static EasyTranslation of(BuildContext context) {
    return Localizations.of<EasyTranslation>(context, EasyTranslation);
  }

  static EasyTranslation instance;

  EasyTranslation() {
    instance = this;
  }

  Map<String, String> _localizedStrings;
  Map<String, String> _defaultStrings;

  Future<bool> _load() async {
    Locale _locale = await _getDeviceLocale();
    if (appLocales
        .map((appLocale) => appLocale.languageCode)
        .contains(_locale.languageCode)) {
      _localizedStrings = await _loadStrings(_locale);
    }
    _defaultStrings = await _loadStrings(appLocales.first);
    return true;
  }

  Future<Map<String, String>> _loadStrings(Locale locale) async {
    String jsonString =
        await rootBundle.loadString('language/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    Map<String, String> _decodedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return _decodedStrings;
  }

  Future<Locale> _getDeviceLocale() async {
    final _deviceLocale = await findSystemLocale();
    final _splittedLocale = _deviceLocale.split("_");
    final _deviceLanguageCode = _splittedLocale[0];
    final _deviceCountry = _splittedLocale[1];
    return new Locale(_deviceLanguageCode, _deviceCountry);
  }

  String translate(String key) {
    if (_localizedStrings != null && _localizedStrings[key] != null) {
      return _localizedStrings[key];
    }
    return _defaultStrings[key];
  }
}

class _EasyTranslationDelegate extends LocalizationsDelegate<EasyTranslation> {
  const _EasyTranslationDelegate();

  @override
  bool isSupported(Locale locale) {
    return appLocales
        .map((appLocale) => appLocale.languageCode)
        .contains(locale.languageCode);
  }

  @override
  Future<EasyTranslation> load(Locale locale) async {
    EasyTranslation translations = new EasyTranslation();
    await translations._load();
    return translations;
  }

  @override
  bool shouldReload(_EasyTranslationDelegate old) => false;
}

extension StringTranslate on String {
  String tr({List<String> args = const []}) {
    return EasyTranslation.instance.translate(this);
  }
}
