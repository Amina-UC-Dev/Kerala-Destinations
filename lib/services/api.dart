import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:destinations/routes/routes.dart';
import 'package:destinations/widgets/commonWidget.dart';

class ApiService {
  Future postMultiPartFormDataApi({
    required http.MultipartRequest request,
    required BuildContext context,
    required bool isLoading,
  }) async {
    try {
      print("REQUEST BODY");
      Logger().d(request.fields);
      Logger().d(request.files);
      http.Response response =
          await http.Response.fromStream(await request.send());
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("SUCCESS");
      } else {
        print("FAIL");
      }
      var responseData = json.decode(response.body);
      return responseData;
    } on SocketException {
      if (isLoading) {
        Navigator.pop(context);
      }
      CommonWidgets()
          .showSnack(context: context, msg: "Please connect your network!");
      PageNavigation().gotoNoNetwork(context);
    } catch (e) {
      CommonWidgets().showSnack(msg: e.toString(), context: context);
      return;
    }
  }

  Future postApi({
    required BuildContext context,
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String> header,
    required bool isLoading,
  }) async {
    try {
      print("REQUEST BODY:");
      Logger().d(body);
      final request =
          await http.post(Uri.parse(url), body: body, headers: header);
      var response = json.decode(request.body);
      return response;
    } on SocketException {
      if (isLoading) {
        Navigator.pop(context);
      }
      CommonWidgets()
          .showSnack(context: context, msg: "Please connect your network!");
      PageNavigation().gotoNoNetwork(context);
    } catch (e) {
      CommonWidgets().showSnack(msg: e.toString(), context: context);
      return;
    }
  }

  Future getApi({
    required BuildContext context,
    required String url,
    required Map<String, String> header,
    required bool isLoading,
  }) async {
    try {
      // print("GET URL");
      // print(url);
      final request =
      await http.get(Uri.parse(url),headers: header);
      var response = json.decode(request.body);
      return response;
    } on SocketException {
      if (isLoading) {
        Navigator.pop(context);
      }
      CommonWidgets()
          .showSnack(context: context, msg: "Please connect your network!");
      PageNavigation().gotoNoNetwork(context);
    } catch (e) {
      CommonWidgets().showSnack(msg: e.toString(), context: context);
      return;
    }
  }

  Future deleteApi({
    required BuildContext context,
    required String url,
    required Map<String, String> header,
    required bool isLoading,
  }) async {
    try {
      print("GET URL");
      print(url);
      final request =
      await http.delete(Uri.parse(url),headers: header);
      var response = json.decode(request.body);
      return response;
    } on SocketException {
      if (isLoading) {
        Navigator.pop(context);
      }
      CommonWidgets()
          .showSnack(context: context, msg: "Please connect your network!");
      PageNavigation().gotoNoNetwork(context);
    } catch (e) {
      CommonWidgets().showSnack(msg: e.toString(), context: context);
      return;
    }
  }
}
