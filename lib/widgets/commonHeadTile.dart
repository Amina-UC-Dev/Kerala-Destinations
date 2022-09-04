import 'package:flutter/material.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';



class CommonHeadTile extends StatelessWidget {
  CommonHeadTile({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Style().textStyle(size: 14, w: FontWeight.w400, color: g8),
    );
  }
}
