import 'package:cached_network_image/cached_network_image.dart';
import 'package:discord_recreation/model/server.dart';
import 'package:flutter/material.dart';

class ServerTile extends StatefulWidget {
  final Server? server;

  const ServerTile({this.server});

  @override
  _ServerTileState createState() => _ServerTileState();
}

class _ServerTileState extends State<ServerTile> {
  double? boxRadius;
  double radius = 22;

  double? onHoverHeight, onHoverWidth;

  @override
  void initState() {
    super.initState();
    boxRadius = radius;
    onHoverHeight = 0;
    onHoverWidth = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
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
                onHover: (event) => _changeRadius(),
                onExit: (event) => _resetRadius(),
                child: CircleAvatar(
                  radius: radius,
                  backgroundColor: Color.fromRGBO(32, 34, 37, 1),
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(boxRadius!),
                      color: Color.fromRGBO(32, 34, 37, 1),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.server!.thumbnailUrl ?? "",
                    ),
                    clipBehavior: Clip.antiAlias,
                    duration: Duration(milliseconds: 150),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _changeRadius() {
    setState(() {
      boxRadius = radius * 0.75;
      onHoverHeight = 22;
      onHoverWidth = 4;
    });
  }

  void _resetRadius() {
    setState(() {
      boxRadius = radius;
      onHoverHeight = 0;
      onHoverWidth = 0;
    });
  }
}
