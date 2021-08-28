import 'package:flutter/material.dart';

class HeaderAddButton extends StatefulWidget {
  const HeaderAddButton({Key? key}) : super(key: key);

  @override
  _HeaderAddButtonState createState() => _HeaderAddButtonState();
}

class _HeaderAddButtonState extends State<HeaderAddButton> {
  Color backColor = Colors.green;
  Color? textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            'Add Friend',
            style: TextStyle(color: textColor),
            // style: Theme.of(context).textTheme.headline6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: backColor,
          ),
        ),
      ),
    );
  }
}
