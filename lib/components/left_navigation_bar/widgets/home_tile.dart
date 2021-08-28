import 'package:flutter/material.dart';

class HomeTile extends StatefulWidget {
  @override
  _HomeTileState createState() => _HomeTileState();
}

class _HomeTileState extends State<HomeTile> {
  Color? backColor;
  double radius = 22;
  double? boxRadius;
  double? onHoverHeight, onHoverWidth;

  @override
  void initState() {
    super.initState();
    backColor = Color.fromRGBO(54, 57, 63, 1);
    boxRadius = radius;

    onHoverHeight = 0;
    onHoverWidth = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5),
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
                  // margin: EdgeInsets.symmetric(vertical: 5),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: backColor,
                    borderRadius: BorderRadius.circular(boxRadius!),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      'icons/discord.png',
                      color: Colors.white,
                      fit: BoxFit.contain,
                    ),
                  ),
                  duration: Duration(milliseconds: 100),
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
      // showOnHover = true;
      backColor = Color.fromRGBO(89, 100, 244, 1);
      boxRadius = radius * 0.75;
      onHoverHeight = 22;
      onHoverWidth = 4;
    });
  }

  void _resetColor() {
    setState(() {
      backColor = Color.fromRGBO(54, 57, 63, 1);
      boxRadius = radius;
      onHoverHeight = 0;
      onHoverWidth = 0;
    });
  }
}
