import 'package:device_info_csx/device_info_csx.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:destinations/providers/temple_provider.dart';

class UserSharedPref {
  static const String CUSTOMER_ID = "CUSTOMER_ID";
  static const String CUSTOMER_NAME = "CUSTOMER_NAME";
  static const String MOBILE = "MOBILE";
  static const String TOKEN = "TOKEN";
  static const String LATITUDE = "LATITUDE";
  static const String LONGITUDE = "LONGITUDE";

  Future<String> getDeviceId() async {
    Map<String, dynamic> deviceData = <String, dynamic>{};
    deviceData = (await DeviceInfoCsx.androidInfo()).toJson();
    print("ANDROID DEVICE INFO");
    return deviceData["androidId"];
  }

  void setCustomerId(String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("CUSTOMER ID SETTING : ");
    print(id);
    preferences.setString(CUSTOMER_ID, id);
  }

  Future<String?> getCustomerId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      print("GETTING CUSTOMER ID ");
      print(preferences.getString(CUSTOMER_ID));
      return preferences.getString(CUSTOMER_ID);
    } catch (e) {
      return null;
    }
  }

  void setCustomerName(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("CUSTOMER NAME SETTING : ");
    print(name);
    preferences.setString(CUSTOMER_NAME, name);
  }

  Future<String?> getCustomerName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      print("GETTING CUSTOMER NAME ");
      print(preferences.getString(CUSTOMER_NAME));
      return preferences.getString(CUSTOMER_NAME);
    } catch (e) {
      return null;
    }
  }

  void setMobile(String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("MOBILE SETTING : ");
    print(id);
    preferences.setString(MOBILE, id);
  }

  Future<String?> getMobile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      print("GETTING MOBILE ");
      print(preferences.getString(MOBILE));
      return preferences.getString(MOBILE);
    } catch (e) {
      return null;
    }
  }

  void setToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("CUSTOMER TOKEN SETTING : ");
    print(token);
    preferences.setString(TOKEN, token);
  }

  Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      print("GETTING CUSTOMER TOKEN ");
      print(preferences.getString(TOKEN));
      return preferences.getString(TOKEN);
    } catch (e) {
      return null;
    }
  }

  requestLocation(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        requestLocation(context);
        print('Location permissions are denied');
      } else if (permission == LocationPermission.deniedForever) {
        requestLocation(context);
        print("'Location permissions are permanently denied");
      } else {
        getLocation(context);
        print("GPS Location service is granted");
      }
    }else if (permission == LocationPermission.deniedForever) {
      print("'Location permissions are permanently denied 222");
      requestLocation(context);
    } else {
      getLocation(context);
      print("GPS Location permission granted.");
    }
  }

  getLocation(BuildContext context) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String long = position.longitude.toString();
    String lat = position.latitude.toString();
    print("CUSTOMER TOKEN SETTING : ");
    print(lat);
    print(long);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(LATITUDE, lat.toString());
    preferences.setString(LONGITUDE, long.toString());
  }

  Future<List<String>> returnLocation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return [
      "${preferences.getString(LATITUDE)}",
      "${preferences.getString(LONGITUDE)}"
    ];
  }

  void clearAllData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
