import 'package:flutter/material.dart';

class StageDiscoveryDetail extends StatelessWidget {
  const StageDiscoveryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(54, 57, 63, 1),
      child: Center(
        child: Text(
          'Stage Discovery Detail',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
