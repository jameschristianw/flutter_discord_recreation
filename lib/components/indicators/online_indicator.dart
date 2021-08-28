import 'package:flutter/material.dart';

import '../../../../constants/global_colors.dart' as GlobalColors;

class OnlineIndicator extends StatelessWidget {
  OnlineIndicator({Key? key}) : super(key: key);
  double indicatorSize = 16;
  late double indicatorRadius;

  @override
  Widget build(BuildContext context) {
    indicatorRadius = indicatorSize / 2;
    return Container(
      height: indicatorSize,
      width: indicatorSize,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: GlobalColors.lighterGrey,
        borderRadius: BorderRadius.circular(indicatorRadius),
      ),
      child: Container(
        height: indicatorSize,
        width: indicatorSize,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(indicatorRadius),
        ),
      ),
    );
  }
}
