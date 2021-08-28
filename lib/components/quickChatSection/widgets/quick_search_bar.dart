import 'package:flutter/material.dart';

import '../../../constants/global_colors.dart' as GlobalColors;

class QuickSearchBar extends StatelessWidget {
  const QuickSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: GlobalColors.darkGrey,
        ),
        child: TextField(
          style: TextStyle(
            color: GlobalColors.textColor,
            fontSize: 13,
          ),
          decoration: InputDecoration(
            isDense: true,
            border: UnderlineInputBorder(borderSide: BorderSide.none),
            hintText: "Find or start a conversation",
            hintStyle: TextStyle(
              color: GlobalColors.textColor,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
