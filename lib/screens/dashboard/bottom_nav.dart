import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';
import 'package:destinations/routes/routes.dart';
import 'package:destinations/screens/dashboard/dashboard.dart';

FloatingActionButton FloatingButton(BuildContext context,int page) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => DashBoard()),
          (route) => false);
    },
    tooltip: "HOME",
    backgroundColor: Colors.white,
    child: IconButton(
        padding: EdgeInsets.all(0.0),
        color: Colors.white,
        icon: Image.asset(
          'assets/home.png',
          height: 27,
          color: page == 0 ? primary : Color.fromRGBO(143, 144, 145, 1.0),
        ),
        onPressed: null //do something,
        ),
    elevation: 6,
  );
}

Widget BottomBarUI(context, page) {
  return BottomAppBar(
    elevation: 15,
    child: Container(
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: showActions(context, page),
      ),
    ),
    shape: CircularNotchedRectangle(),
    color: Colors.white,
  );
}

List<Widget> showActions(context, page) {
  var w = MediaQuery.of(context).size.width;
  return <Widget>[
    InkWell(
      onTap: () {
          PageNavigation().gotoNearMe(context,page);
      },
      child: Padding(
        padding: EdgeInsets.only(left: w / 9, right: w / 9, top: 5, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/near2.png',
              height: 25,
              color: page == 1 ? primary : Color.fromRGBO(143, 144, 145, 1.0),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Near Me",
                style: page == 1
                    ? Style()
                        .textStyle(size: 12, w: FontWeight.w400, color: primary)
                    : Style().textStyle(
                        size: 12,
                        w: FontWeight.w400,
                        color: Color.fromRGBO(143, 144, 145, 1.0)),
              ),
            )
          ],
        ),
      ),
    ),
    SizedBox(
      width: 50,
    ),
    InkWell(
      onTap: () {
          PageNavigation().gotoTemples(context,page);
      },
      child: Padding(
        padding: EdgeInsets.only(left: w / 9, right: w / 9, top: 5, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/destination.png',
              // 'assets/destination.png',
              height: 25,
              color: page == 2 ? primary : Color.fromRGBO(143, 144, 145, 1.0),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Destinations",
                style: page == 2 ? Style()
                  .textStyle(size: 12, w: FontWeight.w400, color: primary)
                    : Style().textStyle(
                size: 12,
                w: FontWeight.w400,
                color: Color.fromRGBO(143, 144, 145, 1.0)),
              ),
            )
          ],
        ),
      ),
    ), //Icon home
  ];
}
