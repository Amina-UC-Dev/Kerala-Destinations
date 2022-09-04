import 'package:destinations/screens/temples/local_temples.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';
import 'package:destinations/providers/auth_provider.dart';
import 'package:destinations/providers/temple_provider.dart';
import 'package:destinations/screens/onboarding/spalsh_screen.dart';
import 'package:destinations/widgets/commonAppBAr.dart';


class OfflineDashBoard extends StatelessWidget {
  const OfflineDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: HomeAppBar2(),
      ),
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
                    height: 50,
                  ),
                  Text(
                    "Yor are now in Offline Mode!",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        color: white,
                        wordSpacing: 0,
                        height: 2
                    ),textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Your Data will be saved on local device and synchronised with live when the connection will be available!",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w100,
                        color: white,
                      wordSpacing: 0,
                      height: 2
                    ),textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: w / 5,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    height: 45,
                    minWidth: MediaQuery.of(context).size.width,
                    color: white,
                    onPressed: (){
                      Provider.of<TempleProvider>(context,listen: false).getLocalDestinations(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LocalDestinations()));
                    },
                    child: Text(
                      "Continue",
                      style: Style()
                          .textStyle(size: 16, w: FontWeight.w700, color: primary),maxLines: 1,overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class OfflineUploadDashBoard extends StatefulWidget {
  const OfflineUploadDashBoard({Key? key}) : super(key: key);

  @override
  State<OfflineUploadDashBoard> createState() => _OfflineUploadDashBoardState();
}

class _OfflineUploadDashBoardState extends State<OfflineUploadDashBoard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TempleProvider>(context,listen: false).uploadLocalTemple(context: context);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: primary,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: HomeAppBar3(),
        ),
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
                      height: 50,
                    ),
                    Text(
                      "Please wait,\nDon't go anywhere!\nYour saved local device Destinations are uploading...", style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w100,
                          color: white,
                          wordSpacing: 0,
                          height: 2
                      ),textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Uploading Destinations!",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w900,
                              color: white,
                              wordSpacing: 0,
                              height: 2
                          ),textAlign: TextAlign.left,
                        ),
                        SizedBox(width: 15,),
                        Image.asset(
                          "assets/load.gif",
                          height: 50,
                          color: white,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(height: h,width: w,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/no-signal.png",
                  height: w/2.5,
                ),
                SizedBox(height: 25,),
                Text("Ooops!",style: Style().textStyle(
                    w: FontWeight.w600,
                    size: 35,
                    color: g6),),
                SizedBox(height: 40,),
                Text("No Internet Connection found\nCheck your connection.",style: Style().textStyle(
                    w: FontWeight.w400,
                    size: 14,
                    color: g5),textAlign: TextAlign.center,),
                SizedBox(height: 20,),
                MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(
                    color: g8,
                  )),
                  onPressed: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);},
                  child: Text("Try Again",style: Style().textStyle(w: FontWeight.w500, size: 15, color: g8),),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
