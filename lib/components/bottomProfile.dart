import 'package:cached_network_image/cached_network_image.dart';
import 'package:discord_recreation/model/user.dart';
import 'package:flutter/material.dart';

import '../../../constants/globalColors.dart' as GlobalColors;

class BottomProfile extends StatefulWidget {
  const BottomProfile({Key? key}) : super(key: key);

  @override
  _BottomProfileState createState() => _BottomProfileState();
}

class _BottomProfileState extends State<BottomProfile> {
  User user = User(
    id: 2205,
    username: 'potato',
    profilePictureUrl:
        "https://static8.depositphotos.com/1377527/943/i/600/depositphotos_9431737-stock-photo-portrait-of-gray-striped-cat.jpg",
    email: "oridinary.potato@gmail.com",
    phoneNo: "+628123456789",
  );

  Color backColor = GlobalColors.darkerGrey;
  double radius = 35;
  bool hasProfPic = true;
  Color? textColor;
  bool showRemove = false;

  String shortenedName = "";

  double? ppOpacity;

  @override
  void initState() {
    super.initState();

    textColor = GlobalColors.textColor;
    ppOpacity = 1;

    if (user.profilePictureUrl == null) {
      hasProfPic = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: GlobalColors.darkerGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(7.5),
            height: radius,
            width: radius,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
            ),
            child: MouseRegion(
              onHover: (event) => {
                setState(() => {ppOpacity = 0.8})
              },
              onExit: (event) => {
                setState(() => {ppOpacity = 1})
              },
              child: CircleAvatar(
                radius: radius,
                backgroundColor: Color.fromRGBO(32, 34, 37, 1),
                child: !hasProfPic
                    ? Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          'icons/discord.png',
                          color: Colors.white,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Opacity(
                        opacity: ppOpacity!,
                        child: CachedNetworkImage(
                          imageUrl: user.profilePictureUrl ?? "",
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            clipBehavior: Clip.antiAlias,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.username!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "#${user.id!}",
                style: TextStyle(
                  color: GlobalColors.textColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButtonHover(
            icon: Icons.mic,
          ),
          IconButtonHover(
            icon: Icons.headset,
          ),
          IconButtonHover(
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}

class IconButtonHover extends StatefulWidget {
  final IconData? icon;
  IconButtonHover({Key? key, this.icon}) : super(key: key);

  @override
  _IconButtonHoverState createState() => _IconButtonHoverState();
}

class _IconButtonHoverState extends State<IconButtonHover> {
  Color backColor = GlobalColors.darkerGrey;
  double radius = 35;
  bool hasProfPic = true;
  Color? iconColor;
  bool showRemove = false;
  IconData? icon;

  String shortenedName = "";

  @override
  void initState() {
    super.initState();

    iconColor = GlobalColors.textColor;
    icon = widget.icon!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onIconTap(),
      child: MouseRegion(
        onHover: (event) => _changeColor(),
        onExit: (event) => _resetColor(),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: backColor,
          ),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }

  onIconTap() {
    print('tapping icon');
    if (icon == Icons.mic) {
      print('tapping icon mic');
      setState(() {
        icon = Icons.mic_off;
      });
      return;
    }

    if (icon == Icons.mic_off) {
      print('tapping icon mic off');
      setState(() {
        icon = Icons.mic;
      });
      return;
    }

    if (icon == Icons.headset) {
      setState(() {
        icon = Icons.headset_off;
      });
      return;
    }

    if (icon == Icons.headset_off) {
      setState(() {
        icon = Icons.headset;
      });
      return;
    }
  }

  void _changeColor() {
    setState(() {
      backColor = GlobalColors.selectedColor;
      iconColor = Colors.white70;
    });
  }

  void _resetColor() {
    setState(() {
      backColor = GlobalColors.darkerGrey;
      iconColor = GlobalColors.textColor;
    });
  }
}
