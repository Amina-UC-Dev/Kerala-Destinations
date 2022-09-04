import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';
import 'package:destinations/providers/auth_provider.dart';
import 'package:destinations/providers/database_provider.dart';
import 'package:destinations/routes/routes.dart';
import 'package:destinations/services/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }

  timer() async {
    String? customerId = await UserSharedPref().getCustomerId();
    String? mobile = await UserSharedPref().getMobile();
    String? token = await UserSharedPref().getToken();
    Timer(Duration(seconds: 2), () async{
    await  Provider.of<LocalDataBaseProvider>(context,listen: false).initDatabase();
      if (customerId != null && mobile != null && token != null){
        UserSharedPref().requestLocation(context);
        Provider.of<AuthProvider>(context,listen: false).goHome(context);
      }else{
        PageNavigation().gotoLogin(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primary,
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset("assets/logo.png",height: w/4,color: white,),
          // SizedBox(height: 5,),
          Text("Kerala Destinations",style: Style().logoStyle(size: 30, w: FontWeight.w500, color: white)),
        ],
      )),
    );
  }
}
