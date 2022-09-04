import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';
import 'package:destinations/providers/auth_provider.dart';
import 'package:destinations/routes/routes.dart';
import 'package:destinations/screens/dashboard/bottom_nav.dart';
import 'package:destinations/widgets/commonAppBAr.dart';
import 'package:destinations/widgets/dashboardTile.dart';
import 'package:destinations/widgets/homeTile.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: HomeAppBar(),
      ),
      bottomNavigationBar: BottomBarUI(context, 0),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButton(context, 0),
      body: SingleChildScrollView(
        child: Consumer<AuthProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: white,
                    child: Image.asset(
                      "assets/profile.png",
                      height: 20,
                      color: primary,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Hello, ${provider.customerName}",
                    style: Style()
                        .textStyle(size: 22, w: FontWeight.w900, color: white),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Let's Enjoy your Dream Vacation",
                    style: Style()
                        .textStyle(size: 17, w: FontWeight.w900, color: white),
                  ),
                  SizedBox(
                    height: w / 5,
                  ),
                  const HomeTile(),
                  SizedBox(
                    height: w / 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DashBoardTile(
                        callB: () {
                          PageNavigation().gotoTemples(context,0);
                        },
                        title: "Destination",
                        image: "assets/destination3.png",
                      ),
                      DashBoardTile(
                        callB: () {
                          PageNavigation().gotoNearMe(context,0);
                        },
                        title: "Near Me",
                        image: "assets/near.png",
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
