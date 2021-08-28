import 'package:cached_network_image/cached_network_image.dart';
import 'package:discord_recreation/model/user.dart';
import 'package:flutter/material.dart';

import '../../../../constants/global_colors.dart' as GlobalColors;

class QuickFriendListItem extends StatefulWidget {
  final User? friend;
  QuickFriendListItem({this.friend});

  @override
  _QuickFriendListItemState createState() => _QuickFriendListItemState();
}

class _QuickFriendListItemState extends State<QuickFriendListItem> {
  Color backColor = GlobalColors.lightGrey;
  double radius = 35;
  bool hasProfPic = true;
  Color? textColor;
  bool showRemove = false;

  String shortenedName = "";

  @override
  void initState() {
    super.initState();

    textColor = GlobalColors.textColor;

    if (widget.friend!.profilePictureUrl == null) {
      hasProfPic = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: MouseRegion(
        onHover: (event) => _changeColor(),
        onExit: (event) => _resetColor(),
        child: Padding(
          padding: EdgeInsets.only(bottom: 5, left: 7.5, right: 7.5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: backColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(7.5),
                  height: radius,
                  width: radius,
                  decoration: BoxDecoration(
                    color: !hasProfPic
                        ? GlobalColors.lightGrey
                        : Color.fromRGBO(32, 34, 37, 1),
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  child: CircleAvatar(
                    radius: radius,
                    child: !hasProfPic
                        ? Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                              'icons/discord.png',
                              color: Colors.white,
                              fit: BoxFit.cover,
                            ),
                          )
                        : CachedNetworkImage(
                            imageUrl: widget.friend!.profilePictureUrl ?? "",
                            fit: BoxFit.cover,
                          ),
                  ),
                  clipBehavior: Clip.antiAlias,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.friend?.username ?? '',
                  style: TextStyle(color: textColor),
                ),
                Spacer(),
                if (showRemove)
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.white54,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _changeColor() {
    setState(() {
      backColor = GlobalColors.selectedColor;
      textColor = Colors.white;
      showRemove = true;
    });
  }

  void _resetColor() {
    setState(() {
      backColor = GlobalColors.lightGrey;
      textColor = GlobalColors.textColor;
      showRemove = false;
    });
  }
}
