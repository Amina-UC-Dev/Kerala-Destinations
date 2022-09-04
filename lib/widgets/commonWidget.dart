import 'package:flutter/material.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';

class CommonWidgets {
  showSnack({required String msg, required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }

  showLoaderAlert({required BuildContext context}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          content: Center(
            child: Image.asset(
              "assets/load.gif",
              height: 85,
              color: primary,
            ),
          )),
    );
  }

  showLoader() {
    return Center(
      child: Image.asset(
        "assets/load.gif",
        height: 60,
        color: primary,
      ),
    );
  }

  showNoData(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/empty.png",
            height: MediaQuery.of(context).size.width/2.5,
          ),
          SizedBox(height: 30,),
          Text("No data!",style: Style().textStyle(size: 20, w: FontWeight.w700, color: g7),)
        ],
      ),
    );
  }
}
