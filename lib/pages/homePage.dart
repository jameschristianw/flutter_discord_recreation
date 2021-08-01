import 'package:discord_recreation/components/test.dart';
import 'package:flutter/material.dart';

import 'package:discord_recreation/components/leftNavigationBar/NavigationBar.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  static const pageTitle = "Discord";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationBar(),
          Expanded(
            child: TestWidget(),
          ),
        ],
      ),
    );
  }
}
