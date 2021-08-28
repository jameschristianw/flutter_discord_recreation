import 'package:flutter/material.dart';

import '../../../../constants/global_colors.dart' as GlobalColors;

class DoNotDisturbIndicator extends StatelessWidget {
  DoNotDisturbIndicator({Key? key}) : super(key: key);

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
        padding: EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(indicatorRadius),
        ),
        child: Divider(
          thickness: 2,
          // width: 1,
          color: GlobalColors.lighterGrey,
        ),
      ),
    );
  }
}
