import 'package:destinations/models/destination_detail_model.dart';
import 'package:destinations/models/detination_list_model.dart';
import 'package:destinations/screens/temples/add_local_temple.dart';
import 'package:destinations/screens/temples/add_temple.dart';
import 'package:destinations/screens/temples/temple_detail.dart';
import 'package:destinations/screens/temples/temples_list.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:destinations/providers/auth_provider.dart';
import 'package:destinations/providers/temple_provider.dart';
import 'package:destinations/screens/dashboard/dashboard.dart';
import 'package:destinations/screens/near_me/near_me.dart';
import 'package:destinations/screens/no_network.dart';
import 'package:destinations/screens/onboarding/forgot_password.dart';
import 'package:destinations/screens/onboarding/otp_screen.dart';
import 'package:destinations/screens/onboarding/save_customer.dart';
import 'package:destinations/screens/onboarding/signup.dart';
import 'package:destinations/screens/preview/image_preview.dart';
import 'package:destinations/services/shared_pref.dart';

class PageNavigation {

  gotoLogin(BuildContext context) {
    Provider.of<AuthProvider>(context,listen: false).resetForm();
    UserSharedPref().requestLocation(context);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignUpScreen()));
  }

  gotoOtp(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OtpVerificationScreen()));
  }

  gotoSaveCustomer(BuildContext context) {
    Provider.of<AuthProvider>(context,listen: false).getStates(context: context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SaveCustomer()));
  }

  gotoSignUp(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpScreen()));
  }

  gotoForgotPassword(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgotPassword()));
  }

  gotoDashboard(BuildContext context) async {
    Provider.of<TempleProvider>(context,listen: false).getNearestDestination(context: context);
    Provider.of<TempleProvider>(context,listen: false).getDestinations(context: context);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const DashBoard()), (route) => false);
  }

  gotoTemples(BuildContext context,int type) {
    if(type != 2){
      Provider.of<TempleProvider>(context,listen: false).templeName.text = "";
      Provider.of<TempleProvider>(context,listen: false).notifyListeners();
      Provider.of<TempleProvider>(context, listen: false)
          .getDestinations(context: context);
      // Provider.of<TempleProvider>(context,listen: false).getTempleTypes(context: context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Temples()));
    }
  }

  gotoAddTemples(BuildContext context) {
    Provider.of<TempleProvider>(context,listen: false).reset(context: context);
    Provider.of<TempleProvider>(context,listen: false).init();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTemples()));
  }

  gotoLocalAddTemples(BuildContext context) {
    Provider.of<TempleProvider>(context,listen: false).reset(context: context);
    Provider.of<TempleProvider>(context,listen: false).init();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddLocalTemples()));
  }

  gotoEditTemples(BuildContext context,DestinationDetail temp) {
    Provider.of<TempleProvider>(context,listen: false).reset(context: context);
    Provider.of<TempleProvider>(context,listen: false).init();
    Provider.of<TempleProvider>(context,listen: false).edit(data: temp, context: context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTemples()));
  }

  gotoLocalEditTemples(BuildContext context,DestinationLD temp) {
    Provider.of<TempleProvider>(context,listen: false).reset(context: context);
    Provider.of<TempleProvider>(context,listen: false).init();
    Provider.of<TempleProvider>(context,listen: false).editLocal(data: temp, context: context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddLocalTemples()));
  }

  gotoTempleDetail(BuildContext context,String templeId,bool fromNear) {
    Provider.of<TempleProvider>(context,listen: false).getDestinationDetail(context: context,destinationId: templeId);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TempleDetailScreen(fromNear: fromNear,)));
  }

  gotoNearMe(BuildContext context,int type) {
    if(type != 1){
      Provider.of<TempleProvider>(context,listen: false).templeName.text = "";
      Provider.of<TempleProvider>(context,listen: false).notifyListeners();
      Provider.of<TempleProvider>(context,listen: false).getNearestDestination(context: context);
      // Provider.of<TempleProvider>(context,listen: false).getTempleTypes(context: context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NearMe()));
    }
  }

  gotoImagePreview(BuildContext context,String img) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ImagePreview(url: img,)));
  }

  gotoNoNetwork(BuildContext context,)  async {
    String? customerId = await UserSharedPref().getCustomerId();
    if(customerId != null){
      Provider.of<TempleProvider>(context,listen: false).getList(context);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const OfflineDashBoard()), (route) => false);
    }else{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const NoNetworkScreen()), (route) => false);
    }
  }

}
