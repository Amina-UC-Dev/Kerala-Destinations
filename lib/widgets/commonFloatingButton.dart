import 'package:flutter/material.dart';
import 'package:destinations/widgets/commonButton.dart';

class CommonFloatingButton extends StatelessWidget {
  CommonFloatingButton(
      {Key? key,
      required this.callB,
      required this.width,
      required this.title,
      required this.image})
      : super(key: key);

  String title, image;
  double width;
  Function() callB;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CommonButton2(
        title: title,
        icon: image,
        ontap: callB,
        width: width,
      ),
    );
  }
}
