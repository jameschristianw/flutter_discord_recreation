import 'package:cached_network_image/cached_network_image.dart';
import 'package:discord_recreation/components/indicators/do_not_disturb_indicator.dart';
import 'package:discord_recreation/components/indicators/offline_indicator.dart';
import 'package:discord_recreation/components/indicators/online_indicator.dart';
import 'package:discord_recreation/model/user.dart';
import 'package:flutter/material.dart';

import '../../../../constants/global_colors.dart' as GlobalColors;

class FriendItem extends StatefulWidget {
  final User? friend;

  const FriendItem({Key? key, this.friend}) : super(key: key);

  @override
  _FriendItemState createState() => _FriendItemState();
}

class _FriendItemState extends State<FriendItem> {
  Color? textColor;
  Color backColor = GlobalColors.lighterGrey;
  bool showTag = false;
  double size = 35;
  late double radius;
  bool hasProfPic = true;

  Color bgIconColor = GlobalColors.darkGrey.withOpacity(0.3);
  Color borderColor = Colors.grey.shade600;
  // Color borderColor =GlobalColors.selectedColor;

  @override
  void initState() {
    super.initState();

    if (widget.friend!.profilePictureUrl == null) {
      hasProfPic = false;
    }
  }

  Widget indicator() {
    if (widget.friend!.status == 'Online') return OnlineIndicator();
    if (widget.friend!.status == 'Do Not Disturb')
      return DoNotDisturbIndicator();
    return OfflineIndicator();
  }

  @override
  Widget build(BuildContext context) {
    radius = size / 2;

    return Column(
      children: [
        Container(
          height: 0.5,
          width: double.infinity,
          color: showTag ? null : borderColor,
          margin: EdgeInsets.symmetric(horizontal: 30),
        ),
        MouseRegion(
          onHover: (event) => _changeColor(),
          onExit: (event) => _resetColor(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: backColor,
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: CircleAvatar(
                        radius: 17,
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
                                imageUrl:
                                    widget.friend!.profilePictureUrl ?? "",
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: -2,
                      right: -2,
                      child: indicator(),
                    )
                  ],
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '${widget.friend?.username}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          if (showTag)
                            TextSpan(
                              text: '#${widget.friend?.id}',
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.friend?.status ?? '',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: bgIconColor,
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  height: size,
                  width: size,
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Icon(
                        Icons.chat,
                        color: Colors.white70,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    color: bgIconColor,
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white70,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Container(
        //   height: 0.5,
        //   width: double.infinity,
        //   color: showTag ? null : borderColor,
        //   margin: EdgeInsets.symmetric(horizontal: 30),
        // ),
      ],
    );
  }

  void _changeColor() {
    setState(() {
      backColor = Colors.grey.shade400.withOpacity(0.1);
      textColor = Colors.white;
      // bgIconColor = GlobalColors.darkerGrey;
      showTag = true;
    });
  }

  void _resetColor() {
    setState(() {
      backColor = GlobalColors.lighterGrey;
      textColor = GlobalColors.textColor;
      // bgIconColor = GlobalColors.darkGrey.withOpacity(0.3);
      showTag = false;
    });
  }
}
