import 'package:easy_translation/my_home_page.dart';
import 'package:flutter/material.dart';
import 'easy_translation.dart';

void main() {
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
