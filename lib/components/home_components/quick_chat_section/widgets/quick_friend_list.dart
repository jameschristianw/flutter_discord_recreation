import 'package:discord_recreation/dummy/friend_list.dart';
import 'package:flutter/material.dart';

import 'quick_direct_message.dart';
import 'quick_friend_list_item.dart';

class QuickFriendList extends StatelessWidget {
  const QuickFriendList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          QuickDirectMessage(),
          ...dummyFriendList
              .map(
                (friend) => QuickFriendListItem(
                  friend: friend,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
