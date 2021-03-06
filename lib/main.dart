import 'package:easy_translation/my_home_page.dart';
import 'package:flutter/material.dart';
import 'easy_translation.dart';

void main() {
  appLocales = [
    Locale('en', 'US'),
    Locale('fr', 'FR'),
    Locale('it', 'IT'),
  ];
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: appLocales,
      localizationsDelegates: easyTranslationDelegates,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Easy translation example'),
    );
  }
}
