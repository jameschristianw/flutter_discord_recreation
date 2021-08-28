import 'package:discord_recreation/constants/constants.dart';
import 'package:discord_recreation/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'quick_menu_item.dart';

class QuickMenu extends StatefulWidget {
  @override
  _QuickMenuState createState() => _QuickMenuState();
}

class _QuickMenuState extends State<QuickMenu> {
  // bool _isSelected = false;
  late MenuProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MenuProvider>(context);

    // print("Listening to provider");

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _onMenuTap(Menu.Friends.index),
            child: QuickMenuItem(
              menuName: 'Friends',
              icon: Icons.person,
              isSelected: provider.currentMenu == Menu.Friends.index,
              // menu: Menu.Friends.index,
            ),
          ),
          GestureDetector(
            onTap: () => _onMenuTap(Menu.StageDiscovery.index),
            child: QuickMenuItem(
              menuName: 'Stage Discover',
              icon: Icons.menu,
              isSelected: provider.currentMenu == Menu.StageDiscovery.index,
              // menu: Menu.StageDiscovery.index,
            ),
          ),
          GestureDetector(
            onTap: () => _onMenuTap(Menu.Nitro.index),
            child: QuickMenuItem(
              menuName: 'Nitro',
              icon: Icons.list,
              isSelected: provider.currentMenu == Menu.Nitro.index,
              // menu: Menu.Nitro.index,
            ),
          ),
        ],
      ),
    );
  }

  _onMenuTap(menu) {
    print("Menu Tap");
    provider.changeMenu(menu);
    // setState(() {
    //   _isSelected = true;
    // });
  }

  menuTap() {
    print("Public Menu Tap");
  }
}
