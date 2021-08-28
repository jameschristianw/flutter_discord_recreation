import 'package:cached_network_image/cached_network_image.dart';
import 'package:discord_recreation/components/leftNavigationBar/widgets/server_tile.dart';
import 'package:discord_recreation/dummy/server_list.dart';
import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  double? contWidth;
  double? boxRadius;

  double radius = 22.5;

  String imageUrl =
      "https://static8.depositphotos.com/1377527/943/i/600/depositphotos_9431737-stock-photo-portrait-of-gray-striped-cat.jpg";

  @override
  void initState() {
    super.initState();

    boxRadius = radius;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => _onHover(),
      onExit: (event) => _onExit(),
      child: Container(
        color: Color.fromRGBO(54, 57, 63, 1),
        child: Center(
          child: ServerTile(
            server: dummyServers.elementAt(0),
          ),
        ),
      ),
    );
  }

  void _onHover() {
    setState(() {
      boxRadius = radius * 0.5;
    });
  }

  void _onExit() {
    setState(() {
      boxRadius = radius;
    });
  }
}
