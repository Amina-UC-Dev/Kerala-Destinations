import 'package:destinations/screens/temples/temple_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';
import 'package:destinations/providers/temple_provider.dart';
import 'package:destinations/routes/routes.dart';
import 'package:destinations/screens/dashboard/bottom_nav.dart';
import 'package:destinations/screens/onboarding/spalsh_screen.dart';
import 'package:destinations/widgets/commonButton.dart';
import 'package:destinations/widgets/commonFloatingButton.dart';
import 'package:destinations/widgets/commonWidget.dart';

class LocalDestinations extends StatelessWidget {
  LocalDestinations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: AppBar(
              backgroundColor: white,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  )),
              iconTheme: IconThemeData(color: primary),
              centerTitle: true,
              elevation: 0,
              title: Text(
                "Destinations",
                style: Style()
                    .textStyle(size: 18, w: FontWeight.w600, color: black),
              ),actions: [ IconButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);
          }, icon: Icon(Icons.refresh,size: 30,color: primary,)),
            SizedBox(width: 5,)],)),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Consumer<TempleProvider>(builder: (context, provider, child) {
            return SizedBox(
              height: h,
              child: provider.localDestination != null
                  ? Container(
                child:   provider.localDestination.isNotEmpty
                    ? ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                        bottom: 70),
                    itemCount:
                    provider.localDestination.length,
                    itemBuilder: (context, index) {
                      return TempleTile2(
                        data:
                        provider.localDestination[index],
                        fromNear: false,
                      );
                    })
                    : CommonWidgets().showNoData(context),
              )  : CommonWidgets().showLoader(),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 20),
            child: CommonFloatingButton(
              width: 170,
              title: "Add Destination",
              image: "assets/destination.png",
              callB: () {
                PageNavigation().gotoLocalAddTemples(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
