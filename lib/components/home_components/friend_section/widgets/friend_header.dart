import 'package:discord_recreation/components/home_components/friend_section/widgets/header_add_button.dart';
import 'package:discord_recreation/components/home_components/friend_section/widgets/header_icon_button.dart';
import 'package:discord_recreation/components/home_components/friend_section/widgets/header_text_button.dart';
import 'package:discord_recreation/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../../constants/global_colors.dart' as GlobalColors;

class FriendHeader extends StatefulWidget {
  const FriendHeader({Key? key}) : super(key: key);

  @override
  _FriendHeaderState createState() => _FriendHeaderState();
}

class _FriendHeaderState extends State<FriendHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          child: Row(
            children: [
              Icon(
                Icons.person_sharp,
                color: Colors.grey,
              ),
              SizedBox(width: 4),
              Text(
                'Friends',
                style: TextStyle(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 10,
                ),
                child: VerticalDivider(
                  color: Colors.grey[850],
                  width: 1,
                ),
              ),
              HeaderTextButton(
                label: 'Online',
                friendFilter: FriendsHeader.Online.index,
              ),
              HeaderTextButton(
                label: 'All',
                friendFilter: FriendsHeader.All.index,
              ),
              HeaderTextButton(
                label: 'Pending',
                friendFilter: FriendsHeader.Pending.index,
              ),
              HeaderTextButton(
                label: 'Blocked',
                friendFilter: FriendsHeader.Blocked.index,
              ),
              HeaderAddButton(),
              Spacer(),
              HeaderIconButton(
                icon: Icons.chat,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 10,
                ),
                child: VerticalDivider(
                  // color: Colors.grey[850],
                  color: Colors.white,
                  width: 1,
                ),
              ),
              HeaderIconButton(
                icon: Icons.inbox,
              ),
              HeaderIconButton(
                icon: Icons.help_rounded,
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          color: Colors.black.withOpacity(0.25),
        ),
      ],
    );
  }
}
