import 'package:flutter/material.dart';

class NitroDetail extends StatelessWidget {
  const NitroDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(54, 57, 63, 1),
      child: Center(
        child: Text(
          'Nitro Detail',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
