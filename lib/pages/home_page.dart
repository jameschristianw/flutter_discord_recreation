import 'package:discord_recreation/components/home_components/friend_section/friend_list.dart';
import 'package:discord_recreation/components/home_components/nitro_section/nitro_detail.dart';
import 'package:discord_recreation/components/home_components/quick_chat_section/quick_chat.dart';
import 'package:discord_recreation/components/home_components/stage_discovery_section/stage_discovery_detail.dart';
import 'package:discord_recreation/components/left_navigation_bar/navigation_bar.dart';
import 'package:discord_recreation/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  static const pageTitle = "Discord";

  HomePage({Key? key}) : super(key: key);

  final List<Widget> subMenu = [
    FriendList(),
    StageDiscoveryDetail(),
    NitroDetail(),
  ];

  @override
  Widget build(BuildContext context) {
    MenuProvider provider = Provider.of<MenuProvider>(context);

    return Scaffold(
      body: Container(
        child: Row(
          children: [
            NavigationBar(),
            QuickChat(),
            // Expanded(
            //   child: TestWidget(),
            // ),
            Expanded(
              child: subMenu[provider.currentMenu],
            ),
          ],
        ),
      ),
    );
  }
}
