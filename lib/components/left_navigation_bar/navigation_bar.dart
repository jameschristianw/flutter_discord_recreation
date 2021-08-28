import 'package:flutter/material.dart';

import '../../dummy/server_list.dart';
import 'widgets/bottom_tile.dart';
import 'widgets/home_tile.dart';
import 'widgets/server_tile.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: double.infinity,
      color: Color.fromRGBO(32, 34, 37, 1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeTile(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 3),
              height: 2,
              width: 32,
              color: Colors.grey.shade800.withOpacity(0.3),
            ),
            ...dummyServers
                .map((server) => ServerTile(
                      server: server,
                    ))
                .toList(),
            BottomTile(
              icon: Icons.add,
            ),
            // BottomTile(
            //   icon: Icons.compass_calibration_sharp,
            // ),
          ],
        ),
      ),
    );
  }
}
