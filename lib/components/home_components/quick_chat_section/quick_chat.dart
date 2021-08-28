import 'package:flutter/material.dart';

import '../../bottom_profile.dart';
import 'widgets/quick_friend_list.dart';
import 'widgets/quick_menu.dart';
import 'widgets/quick_search_bar.dart';

import '../../../constants/global_colors.dart' as GlobalColors;

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
          QuickSearchBar(),
          Divider(
            height: 1,
            color: Colors.black.withOpacity(0.25),
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
