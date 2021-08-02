import 'package:discord_recreation/components/quickChatSection/widgets/quickMenu.dart';
import 'package:flutter/material.dart';

import '../../components/bottomProfile.dart';
import './widgets/quickFriendList.dart';
import './widgets/quickSearchBar.dart';

import '../../constants/globalColors.dart' as GlobalColors;

class QuickChat extends StatelessWidget {
  QuickChat({Key? key}) : super(key: key);
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      // height: double.infinity,
      color: GlobalColors.lightGrey,
      child: Column(
        children: [
          Column(
            children: [
              QuickSearchBar(),
              Divider(
                height: 1,
                color: Colors.black.withOpacity(0.25),
              ),
            ],
          ),
          Expanded(
            child: Scrollbar(
              showTrackOnHover: true,
              controller: _controller,
              interactive: true,
              child: SingleChildScrollView(
                controller: _controller,
                child: Column(
                  children: [
                    QuickMenu(),
                    QuickFriendList(),
                  ],
                ),
              ),
            ),
          ),
          BottomProfile(),
        ],
      ),
    );
  }
}
