import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';


class CommonButton extends StatelessWidget {
  CommonButton({
    Key? key,
    required this.title,
    required this.ontap,
    required this.color,
  }) : super(key: key);

  String title;
  Function() ontap;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        height: 45,
        minWidth: MediaQuery.of(context).size.width / 2,
        color: color,
        onPressed: ontap,
        child: Text(
          title,
          style: Style()
              .textStyle(size: 15, w: FontWeight.w300, color: white),
        ),
      ),
    );
  }
}

class CommonButton2 extends StatelessWidget {
  CommonButton2(
      {Key? key,
      required this.title,
      required this.ontap,
      required this.icon,
      required this.width})
      : super(key: key);

  String title;
  String icon;
  Function() ontap;
  double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: width,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        color: primary,
        onPressed: ontap,
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 20,
              color: white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: Style()
                  .textStyle(size: 15, w: FontWeight.w500, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class Uploadbutton extends StatelessWidget {
  Uploadbutton(
      {Key? key,
      required this.title,
      required this.ontap,
      required this.icon,
      required this.color,
      required this.width})
      : super(key: key);

  String title;
  Function() ontap;
  double width;
  IconData icon;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: width,
      child: MaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: color)),
        color: white,
        onPressed: ontap,
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select Files",
              style: Style()
                  .textStyle(size: 13, w: FontWeight.w400, color: g8),
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
             icon,
              size: 20,
              color: g8,
            ),
          ],
        ),
      ),
    );
  }
}

class CommonButton3 extends StatelessWidget {
  CommonButton3({
    Key? key,
    required this.title,
    required this.ontap,
    required this.color,
  }) : super(key: key);

  String title;
  Function() ontap;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        height: 45,
        minWidth: MediaQuery.of(context).size.width,
        color: color,
        onPressed: ontap,
        child: Text(
          title,
          style: Style()
              .textStyle(size: 15, w: FontWeight.w300, color: Colors.white),maxLines: 1,overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
