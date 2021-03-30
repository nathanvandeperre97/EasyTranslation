# easy_translation

A flutter project, that allow user to easily use translations.

## Getting Started

### Prerequisites

- Add the flutter_localization dependency to your pubspec.yaml

ex :
```
flutter_localizations:
    sdk: flutter
```

- Add the assets dependecies in your pubspec.yaml, these assets should be in the language folder

ex :
```
flutter:
    assets:
        - language/en.json
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
"example".tr()
```