import 'package:flutter/material.dart';

class BottomTile extends StatefulWidget {
  final IconData? icon;

  BottomTile({required this.icon});

  @override
  _BottomTileState createState() => _BottomTileState();
}

class _BottomTileState extends State<BottomTile> {
  Color? iconColor;
  Color? backColor;
  double radius = 22;
  double? boxRadius;
  double? onHoverHeight, onHoverWidth;

  @override
  void initState() {
    super.initState();
    iconColor = Colors.green;
    backColor = Color.fromRGBO(54, 57, 63, 1);
    boxRadius = radius;

    onHoverHeight = 0;
    onHoverWidth = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 10),
      child: Stack(
        children: [
          Container(
            height: 45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  height: onHoverHeight,
                  width: onHoverWidth!,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => {},
              child: MouseRegion(
                onHover: (event) => _changeColor(),
                onExit: (event) => _resetColor(),
                child: AnimatedContainer(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: backColor,
                    borderRadius: BorderRadius.circular(boxRadius!),
                  ),
                  child: Icon(widget.icon, color: iconColor),
                  duration: Duration(milliseconds: 150),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _changeColor() {
    setState(() {
      iconColor = Colors.white;
      backColor = Colors.green;
      boxRadius = radius * 0.57;

      onHoverHeight = 20;
      onHoverWidth = 5;
    });
  }

  void _resetColor() {
    setState(() {
      iconColor = Colors.green;
      backColor = Color.fromRGBO(54, 57, 63, 1);
      boxRadius = radius;

      onHoverHeight = 0;
      onHoverWidth = 0;
    });
  }
}
