import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/server_page.dart';
import 'pages/setting_page.dart';

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
