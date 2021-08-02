import 'package:flutter/material.dart';

import '../../../constants/globalColors.dart' as GlobalColors;

class QuickMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          QuickMenuItem(
            menuName: 'Friends',
            icon: Icons.person,
          ),
          QuickMenuItem(
            menuName: 'Stage Discover',
            icon: Icons.menu,
          ),
          QuickMenuItem(
            menuName: 'Nitro',
            icon: Icons.list,
          ),
        ],
      ),
    );
  }
}

class QuickMenuItem extends StatefulWidget {
  final String? menuName;
  final IconData icon;

  const QuickMenuItem({
    Key? key,
    required this.menuName,
    required this.icon,
  }) : super(key: key);

  @override
  _QuickMenuItemState createState() => _QuickMenuItemState();
}

class _QuickMenuItemState extends State<QuickMenuItem> {
  Color backColor = GlobalColors.lightGrey;
  Color? textColor;

  @override
  void initState() {
    super.initState();

    textColor = GlobalColors.textColor;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => _changeColor(),
      onExit: (event) => _resetColor(),
      child: Container(
        margin: EdgeInsets.only(bottom: 5, left: 7.5, right: 7.5),
        // padding: EdgeInsets.all(7.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: backColor,
        ),
        // padding: EdgeInsets.all(7.5),
        child: ListTile(
          onTap: () => {},
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
    setState(() {
      backColor = GlobalColors.selectedColor;
      textColor = Colors.white70;
    });
  }

  void _resetColor() {
    setState(() {
      textColor = GlobalColors.textColor;
      backColor = GlobalColors.lightGrey;
    });
  }
}
