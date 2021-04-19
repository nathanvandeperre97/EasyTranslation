# easy_translation

A flutter project, that allow user to easily use translations.

## Getting Started

### Prerequisites

- Add the assets dependecies in your pubspec.yaml, these assets should be in the language folder

ex :
```
flutter:
    assets:
        - language/
```

### Implementation

- In the main of your application, set the supportedLocales and the localizationsDelegates of your MaterialApp

supportedLocales: appLocales,
localizationsDelegates: easyTranslationDelegates,

### Usage

- In the asset json, add a translation key/value

ex :
```
"example": "This is an example of translation"
```

- In any text, use the translation using the key

ex :
```
translate("example")
```

- By default, there will only be english in appLocales, but you can override appLocales before the app run in order to add any locales you want
- The locale used if the device locale isn't in appLocales or if the key doesn't exist in the asset file will be the first locale in appLocales

ex :
```
appLocales = [
    Locale('en', 'US'),
    Locale('fr', 'FR'),
];
runApp(MyApp());
```