import 'package:flutter/material.dart';

class HeaderIconButton extends StatefulWidget {
  final IconData icon;
  const HeaderIconButton({Key? key, required this.icon}) : super(key: key);

  @override
  _HeaderIconButtonState createState() => _HeaderIconButtonState();
}

class _HeaderIconButtonState extends State<HeaderIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          widget.icon,
          color: Colors.white70,
        ));
  }
}
