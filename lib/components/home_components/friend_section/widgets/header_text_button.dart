import 'package:discord_recreation/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/global_colors.dart' as GlobalColors;

class HeaderTextButton extends StatefulWidget {
  final String label;
  final int friendFilter;

  const HeaderTextButton(
      {Key? key, required this.label, required this.friendFilter})
      : super(key: key);

  @override
  _HeaderTextButtonState createState() => _HeaderTextButtonState();
}

class _HeaderTextButtonState extends State<HeaderTextButton> {
  Color backColor = GlobalColors.lighterGrey;
  Color? textColor;
  late bool isHovered;

  @override
  void initState() {
    super.initState();

    isHovered = false;
    textColor = Colors.white70;
  }

  @override
  Widget build(BuildContext context) {
    _resetColor();

    MenuProvider provider = Provider.of<MenuProvider>(context);
    bool isSelected = provider.selectedFriendFilter == widget.friendFilter;

    if (isSelected) {
      backColor = Colors.grey.shade400.withOpacity(0.1);
      textColor = Colors.white;
    }

    return MouseRegion(
      onHover: isSelected ? null : (event) => _changeColor(),
      onExit: isSelected ? null : (event) => _resetColor(),
      cursor: SystemMouseCursors.click,
      // onHover: (event) => _changeColor(),
      // onExit: (event) => _resetColor(),
      child: Row(
        children: [
          SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              provider.changeFriendFilter(widget.friendFilter);
            },
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                widget.label,
                style: TextStyle(color: textColor),
                // style: Theme.of(context).textTheme.headline6,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: backColor,
              ),
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }

  void _changeColor() {
    if (!isHovered)
      setState(() {
        // print("setState Change Color");
        isHovered = true;
        backColor = Colors.grey.shade400.withOpacity(0.1);
        textColor = Colors.white;
      });
  }

  void _resetColor() {
    // print("Reset Color");
    setState(() {
      isHovered = false;
      textColor = Colors.white70;
      backColor = GlobalColors.lighterGrey;
    });
  }
}
