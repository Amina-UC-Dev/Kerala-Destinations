import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';
import 'package:destinations/providers/database_provider.dart';
import 'package:destinations/routes/routes.dart';
import 'package:destinations/screens/onboarding/spalsh_screen.dart';
import 'package:destinations/widgets/commonButton.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primary,
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0,
      title:  Text("Kerala Destinations",style: Style().logoStyle(size: 20, w: FontWeight.w500, color: white)),
      actions: [
        IconButton(onPressed: ()async{
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20),
              title: Text(
                'Logout?',
                style: Style().textStyle(
                    size: 16,
                    w: FontWeight.w600,
                    color: black),
              ),
              content: Text(
                  'Are you sure want to logout?',
                  style: Style().textStyle(
                      size: 14,
                      w: FontWeight.w300,
                      color: black)),
              actionsPadding: EdgeInsets.only(
                  bottom: 15, right: 10, left: 10),
              actions: <Widget>[
                Container(
                    width: 90,
                    height: 35,
                    child: CommonButton(
                        title: "Cancel",
                        ontap: () {
                          Navigator.pop(context);
                        },
                        color: black)),
                Container(
                    width: 90,
                    height: 35,
                    child: CommonButton(
                        title: "Yes",
                        ontap: () async {
                          Navigator.pop(context);
                          Provider.of<LocalDataBaseProvider>(context,listen: false).clearTable();
                          SharedPreferences pref = await SharedPreferences.getInstance();
                          pref.clear();
                          PageNavigation().gotoLogin(context);
                          },
                        color: red)),
              ],
            ),
          );
        }, icon: Image.asset("assets/exit.png",height: 23,color: white,)),
        SizedBox(width: 5,)
      ],
    );
  }
}

class HomeAppBar2 extends StatelessWidget {
  HomeAppBar2({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primary,
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0,
      title:  Text("Kerala Destinations",style: Style().logoStyle(size: 20, w: FontWeight.w500, color: white)),
      actions: [
        IconButton(onPressed: ()async{
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20),
              title: Text(
                'Logout?',
                style: Style().textStyle(
                    size: 16,
                    w: FontWeight.w600,
                    color: black),
              ),
              content: Text(
                  'Are you sure want to logout?',
                  style: Style().textStyle(
                      size: 14,
                      w: FontWeight.w300,
                      color: black)),
              actionsPadding: EdgeInsets.only(
                  bottom: 15, right: 10, left: 10),
              actions: <Widget>[
                Container(
                    width: 90,
                    height: 35,
                    child: CommonButton(
                        title: "Cancel",
                        ontap: () {
                          Navigator.pop(context);
                        },
                        color: black)),
                Container(
                    width: 90,
                    height: 35,
                    child: CommonButton(
                        title: "Yes",
                        ontap: () async {
                          Navigator.pop(context);
                          Provider.of<LocalDataBaseProvider>(context,listen: false).clearTable();
                          SharedPreferences pref = await SharedPreferences.getInstance();
                          pref.clear();
                          PageNavigation().gotoLogin(context);
                        },
                        color: red)),
              ],
            ),
          );
        }, icon: Image.asset("assets/exit.png",height: 23,color: white,)),
        IconButton(onPressed: (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);
        }, icon: Icon(Icons.refresh,size: 30,color: white,)),
        SizedBox(width: 5,)
      ],
    );
  }
}
class HomeAppBar3 extends StatelessWidget {
  HomeAppBar3({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primary,
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0,
      title:  Text("Kerala Destinations",style: Style().logoStyle(size: 20, w: FontWeight.w500, color: white)),
    );
  }
}

class CommonAppBar extends StatelessWidget {
  CommonAppBar({Key? key,required this.title,required this.showB}) : super(key: key);

  String title;
  bool showB;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      automaticallyImplyLeading: showB,
      leading: showB ? IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,size: 20,)) : Container(),
      iconTheme: IconThemeData(color: primary),
      centerTitle: true,
      elevation: 0,
      title: Text(
       title,
        style: Style().textStyle(size: 18, w: FontWeight.w600, color: black),
      ),
    );
  }
}
