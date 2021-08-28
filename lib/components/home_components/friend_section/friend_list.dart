import 'package:discord_recreation/components/home_components/friend_section/widgets/friend_header.dart';
import 'package:discord_recreation/components/home_components/friend_section/widgets/friend_item.dart';
import 'package:discord_recreation/dummy/friend_list.dart';
import 'package:flutter/material.dart';

import '../../../../constants/global_colors.dart' as GlobalColors;

class FriendList extends StatelessWidget {
  FriendList({Key? key}) : super(key: key);
  ScrollController _controller = ScrollController();

  int friendCount = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(54, 57, 63, 1),
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          FriendHeader(),
          Expanded(
            child: Scrollbar(
              showTrackOnHover: true,
              controller: _controller,
              interactive: true,
              child: SingleChildScrollView(
                controller: _controller,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                        top: 20,
                        bottom: 10,
                      ),
                      child: Text(
                        'ONLINE -- $friendCount',
                        style: TextStyle(color: GlobalColors.textColor),
                      ),
                    ),
                    ...dummyFriendList
                        .map(
                          (friend) => FriendItem(
                            friend: friend,
                          ),
                        )
                        .toList(),
                    SizedBox(height: 15)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
