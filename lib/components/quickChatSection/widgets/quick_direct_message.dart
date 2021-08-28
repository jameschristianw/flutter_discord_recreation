import 'package:flutter/material.dart';

import '../../../constants/global_colors.dart' as GlobalColors;

class QuickDirectMessage extends StatefulWidget {
  const QuickDirectMessage({
    Key? key,
  }) : super(key: key);

  @override
  _QuickDirectMessageState createState() => _QuickDirectMessageState();
}

class _QuickDirectMessageState extends State<QuickDirectMessage> {
  Color? textColor;

  @override
  void initState() {
    super.initState();

    textColor = GlobalColors.textColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => {},
            child: MouseRegion(
              onHover: (event) => _changeColor(),
              onExit: (event) => _resetColor(),
              child: Text(
                'DIRECT MESSAGES',
                style: TextStyle(
                  color: textColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.add,
              color: Colors.white54,
            ),
          )
        ],
      ),
    );
  }

  void _changeColor() {
    setState(() {
      // showOnHover = true;
      textColor = Colors.white70;
    });
  }

  void _resetColor() {
    setState(() {
      textColor = GlobalColors.textColor;
    });
  }
}
