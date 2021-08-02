import 'package:discord_recreation/components/quickChatSection/widgets/quickFriendListItem.dart';
import 'package:discord_recreation/dummy/friendList.dart';
import 'package:flutter/material.dart';

import 'quickDirectMessage.dart';

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
