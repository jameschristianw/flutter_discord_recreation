import 'package:flutter/material.dart';

import '../pages/ServerPage.dart';
import '../pages/settingPage.dart';
import '../pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discord Recreation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ServerPage.routeName: (context) => ServerPage(),
        SettingPage.routeName: (context) => SettingPage(),
      },
    );
  }
}
