import 'package:flutter/material.dart';

import '../../../../constants/global_colors.dart' as GlobalColors;

class QuickMenuItem extends StatefulWidget {
  final String? menuName;
  final IconData icon;
  final bool isSelected;

  const QuickMenuItem({
    Key? key,
    required this.menuName,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  @override
  _QuickMenuItemState createState() => _QuickMenuItemState();
}

class _QuickMenuItemState extends State<QuickMenuItem> {
  Color backColor = GlobalColors.lightGrey;
  Color? textColor;
  late bool isHovered;

  @override
  void initState() {
    super.initState();

    isHovered = false;
    textColor = GlobalColors.textColor;
  }

  @override
  Widget build(BuildContext context) {
    _resetColor();
    if (widget.isSelected) {
      backColor = GlobalColors.lighterGrey;
      textColor = Colors.white;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: widget.isSelected ? null : (event) => _changeColor(),
      onExit: widget.isSelected ? null : (event) => _resetColor(),
      child: Container(
        margin: EdgeInsets.only(bottom: 2.5, left: 7.5, right: 7.5),
        // padding: EdgeInsets.all(7.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: backColor,
        ),
        // padding: EdgeInsets.all(7.5),
        child: ListTile(
          leading: Icon(
            widget.icon,
            color: textColor,
            size: 24,
          ),
          title: Text(
            widget.menuName!,
            style: TextStyle(
              color: textColor,
            ),
          ),
          horizontalTitleGap: 0,
          // dense: true,
        ),
      ),
    );
  }

  void _changeColor() {
    if (!isHovered)
      setState(() {
        // print("setState Change Color");
        isHovered = true;
        backColor = GlobalColors.selectedColor;
        textColor = Colors.white70;
      });
  }

  void _resetColor() {
    // print("Reset Color");
    setState(() {
      isHovered = false;
      textColor = GlobalColors.textColor;
      backColor = GlobalColors.lightGrey;
    });
  }

  // void initColor() {
  //   textColor = GlobalColors.textColor;
  //   backColor = GlobalColors.lightGrey;
  // }
}
