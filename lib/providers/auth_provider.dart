import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:destinations/models/customer_response_model.dart';
import 'package:destinations/models/verify_otp_response.dart';
import 'package:destinations/models/login_response.dart';
import 'package:destinations/models/states_list_model.dart';
import 'package:destinations/providers/database_provider.dart';
import 'package:destinations/providers/temple_provider.dart';
import 'package:destinations/routes/routes.dart';
import 'package:destinations/services/api.dart';
import 'package:destinations/services/api_url.dart';
import 'package:destinations/services/shared_pref.dart';
import 'package:destinations/widgets/commonWidget.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();

  LoginResponse? loginResponse;
  VerifyOtpResponse? verifyOtpResponse;
  CustomerResponse? customerResponse;
  States? states;

  String? selectedState;
  String customerName = "";

  TextEditingController mobile = TextEditingController(text: "9567292571");
  TextEditingController password = TextEditingController(text: "anu");
  TextEditingController otp = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  String verificationCode = "";
  String resendToken = "";
  String customerId = "";
  String otpValue = "";

  setOtp(String data){
    otpValue = data;
    notifyListeners();
  }

  setState(String data){
    selectedState = data;
    notifyListeners();
  }

  resetForm(){
    selectedState = null;
    mobile.text = "";
    otp.text = "";
    pinCode.text = "";
    city.text = "";
    name.text = "";
    email.text = "";
    address.text = "";
    otpValue = "";
    verificationCode = "";
    resendToken = "";
    customerId = "";
    notifyListeners();
  }

  void getStates({
    required BuildContext context,
  }) async {
    selectedState = null;
    notifyListeners();
    Map<String, String> header = {
      "x-api-key": ApiUrls().apiKey,
    };
    final response = await apiService.getApi(
      url: '${ApiUrls().baseUrl}state',
      header: header,
      context: context,
      isLoading: false,
    );
    print("STATE RESPONSE");
    Logger().d(response);
    if (response != null) {
      if (response["status"] == 200) {
        print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@");
        states = States.fromJson(response);
      } else {
        print("@@@@@@@@@@@@@@@@@@@@@ FAIL @@@@@@@@@@@@@@@@@@@@@@");
      }
    }
    notifyListeners();
  }

  void register({
    required BuildContext context,
  }) async {
    CommonWidgets().showLoaderAlert(
      context: context,
    );
    Map<String, dynamic> data = {
      "phoneNumber": mobile.text,
    };
    Map<String, String> header = {
      "x-api-key": ApiUrls().apiKey,
    };
    final response = await apiService.postApi(
      url: '${ApiUrls().baseUrl}signup',
      body: data,
      header: header,
      context: context,
      isLoading: true,
    );
    print("REGISTER RESPONSE");
    Logger().d(response);
    if (response != null) {
      if (response["status"] == 200) {
        print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@");
        await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: '+91${mobile.text}',
            verificationFailed: (FirebaseAuthException e) {
              print("P 3");
              print(e.message);
              Navigator.pop(context);
              CommonWidgets()
                  .showSnack(context: context, msg: e.message!);
            },
            codeSent: (String? verID, int? forceCodeResend) {
              Navigator.pop(context);
              print("P 4");
              verificationCode = verID!;
              resendToken = forceCodeResend.toString();
              CommonWidgets().showSnack(msg: "OTP sent to your mobile number!",context: context);
              customerId = response["result"]["customerId"].toString();
              PageNavigation().gotoOtp(context);
            },
            codeAutoRetrievalTimeout: (String verID) {
              print("P 5");
              verificationCode = verID;
            },
            timeout: Duration(seconds: 120),
            verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {  });
        // getStates(context: context);
        // PageNavigation()
        //     .gotoSaveCustomer(context);
      } else {
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);
        print("@@@@@@@@@@@@@@@@@@@@@ FAIL @@@@@@@@@@@@@@@@@@@@@@");
      }
    }
    notifyListeners();
  }

  void login({
    required BuildContext context,
    required String mob,
  }) async {
    CommonWidgets().showLoaderAlert(
      context: context,
    );
    String deviceId = await UserSharedPref().getDeviceId();
    Map<String, dynamic> data = {
      "userName": mob,
      "password": "destination@2020",
      "deviceRegistrationId": deviceId,
    };
    Map<String, String> header = {
      "x-api-key": ApiUrls().apiKey,
    };
    final response = await apiService.postApi(
      url: '${ApiUrls().baseUrl}login',
      body: data,
      header: header,
      context: context,
      isLoading: true,
    );
    print("LOGIN RESPONSE");
    Logger().d(response);
    // Navigator.pop(context);
    if (response != null) {
      if (response["status"] == 200) {
        loginResponse = LoginResponse.fromJson(response);
        UserSharedPref().setCustomerId(loginResponse!.result!.customerId!);
        UserSharedPref().setMobile(loginResponse!.result!.phoneNumber!);
        UserSharedPref().setToken(loginResponse!.token!);
        UserSharedPref().setCustomerName(loginResponse!.result!.customerName!);
        print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@");
        setLocalDBData(context);
      } else {
        Navigator.pop(context);
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);
        print("@@@@@@@@@@@@@@@@@@@@@ FAIL @@@@@@@@@@@@@@@@@@@@@@");
      }
    }
    notifyListeners();
  }

  void setLocalDBData(BuildContext context) async {
    print("CALLING LOCAL DB");
    var tempPro = Provider.of<TempleProvider>(context,listen: false);
    var dbPro = Provider.of<LocalDataBaseProvider>(context,listen: false);
    var states = await tempPro.getStates(context: context);
    var countries = await tempPro.getCountries(context: context);
    var types = await tempPro.getDestinationTypes(context: context);
    print("STATES : ${states.toString()}");
    print("COUNTRY : ${countries.toString()}");
    print("TYPES : ${types.toString()}");
    await dbPro.deleteDataFromDataBase("DELETE FROM States");
    await dbPro.deleteDataFromDataBase("DELETE FROM Countries");
    await dbPro.deleteDataFromDataBase("DELETE FROM DestinationTypes");
    List<Map<String, dynamic>> rawStates = [];
    for (int j = 0; j < states["result"].length; j++) {
      rawStates.add({
        "stateId": states["result"][j]["stateId"].toString(),
        "countryId": states["result"][j]["countryId"].toString(),
        "stateName": states["result"][j]["stateName"].toString(),
        "status": states["result"][j]["status"].toString(),
      });
    }
    List<Map<String, dynamic>> rawCountries = [];
    for (int j = 0; j < countries["result"].length; j++) {
      rawCountries.add({
        "countryId": countries["result"][j]["countryId"].toString(),
        "countryName": countries["result"][j]["countryName"].toString(),
        "countryCode": countries["result"][j]["countryCode"].toString(),
      });
    }
    List<Map<String, dynamic>> rawTypes = [];
    for (int j = 0; j < types["result"].length; j++) {
      rawTypes.add({
        "destinationTypeId" : types["result"][j]["destinationTypeId"].toString(),
        "destinationType": types["result"][j]["destinationType"].toString(),
        "parentDestinationTypeId": types["result"][j]["parentDestinationTypeId"].toString(),
        "isRouteType": types["result"][j]["isRouteType"].toString(),
        "status": types["result"][j]["status"].toString(),
      });
    }
    await dbPro.bulkInsert(rawStates, "States");
    await dbPro.bulkInsert(rawCountries, "Countries");
    await dbPro.bulkInsert(rawTypes, "DestinationTypes");
    setCustomerName();
    bool res = await tempPro.getList(context);
    if(res){
      Navigator.pop(context);
      tempPro.checkLocalDestinations(context);
    }
  }

  goHome(BuildContext context) async{
    CommonWidgets().showLoaderAlert(
      context: context,
    );
    setCustomerName();
    var tempPro = Provider.of<TempleProvider>(context,listen: false);
    bool res = await tempPro.getList(context);
    if(res){
      Navigator.pop(context);
      tempPro.checkLocalDestinations(context);
    }
  }

  setCustomerName() async {
    customerName =  (await UserSharedPref().getCustomerName())!;
    notifyListeners();
  }

  void forgotPassword({
    required BuildContext context,
  }) async {
    CommonWidgets().showLoaderAlert(
      context: context,
    );
    Map<String, dynamic> data = {
      "emailId": email.text,
    };
    Map<String, String> header = {
      "x-api-key": ApiUrls().apiKey,
    };
    final response = await apiService.postApi(
      url: '${ApiUrls().baseUrl}forgot_password',
      body: data,
      header: header,
      context: context,
      isLoading: true,
    );
    print("FORGOT PASSWORD RESPONSE");
    Logger().d(response);
    Navigator.pop(context);
    if (response != null) {
      if (response["status"] == 200) {
        CommonWidgets().showSnack(context: context, msg: response["message"]);
        print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@");
       Navigator.pop(context);
      } else {
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);
        print("@@@@@@@@@@@@@@@@@@@@@ FAIL @@@@@@@@@@@@@@@@@@@@@@");
      }
    }
    notifyListeners();
  }

  void verifyOTPByFirebase({
    required BuildContext context,
  }) async {
    try {
      CommonWidgets().showLoaderAlert(context: context);
      await FirebaseAuth.instance
          .signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationCode,
            smsCode: otpValue),
      )
          .then((value) async {
            verifyOtp(context: context, userId: value.user!.uid);
        print("P 15");
        print("SIGN IN WITH CREDENTIAL RESPONSE");
        print(value);
        print("USER %%%%%%%%%%%%%%");
      });
    } catch (e) {
      Navigator.pop(context);
      CommonWidgets().showSnack(msg: e.toString(),context: context);
    }
  }

  void verifyOtp({
    required BuildContext context,required String userId
  }) async {
    Map<String, dynamic> data = {
      "customerId": customerId,
      "firebaseId": userId,
    };
    Map<String, String> header = {
      "x-api-key": ApiUrls().apiKey,
    };
    final response = await apiService.postApi(
      url: '${ApiUrls().baseUrl}verify_otp',
      body: data,
      header: header,
      context: context,
      isLoading: true,
    );
    print("OTP VERIFY RESPONSE");
    Logger().d(response);
    Navigator.pop(context);
    if (response != null) {
      if (response["status"] == 200) {
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);
        customerResponse = CustomerResponse.fromJson(response);
        if(customerResponse!.result!.status == "0"){
          PageNavigation().gotoSaveCustomer(context);
        }else{
         login(context: context, mob: customerResponse!.result!.phoneNumber!);
        }
        print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@");
      } else {
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);
        print("@@@@@@@@@@@@@@@@@@@@@ FAIL @@@@@@@@@@@@@@@@@@@@@@");
      }
    }
    notifyListeners();
  }

  void resendOTPByFirebase({
    required BuildContext context,
  }) async {
    try {
      CommonWidgets().showLoaderAlert(context: context);
      print("PREVIOUS FIREBASE ID");
      print(verificationCode);
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+91${mobile.text}',
          verificationCompleted: (PhoneAuthCredential
          authCredential) async {},
          forceResendingToken: int.parse(resendToken),
          verificationFailed:
              (FirebaseAuthException e) {
            print("P 3");
            print(e.message);
            Navigator.pop(context);
            CommonWidgets().showSnack(msg: e.message!,context: context);
          },
          codeSent:
              (String? verID, int? forceCodeResend) {
            Navigator.pop(context);
            print("P 4");
            verificationCode = verID!;
            notifyListeners();
            print("FIREBASE ID");
            print(verificationCode);
            CommonWidgets().showSnack(msg: "OTP sent to your mobile number!",context: context);
          },
          codeAutoRetrievalTimeout: (String verID) {
            print("P 5");
            verificationCode = verID;
            notifyListeners();
            print("FIREBASE ID");
            print(verificationCode);
          },
          timeout: Duration(seconds: 120));
    } catch (e) {
      Navigator.pop(context);
      CommonWidgets().showSnack(msg: e.toString(),context: context);
    }
  }

  void saveCustomer({
    required BuildContext context,
  }) async {
    CommonWidgets().showLoaderAlert(context: context);
    Map<String, dynamic> data = {
      "customerId": customerId,
      "emailId": email.text,
      "customerName": name.text,
      "address": address.text,
      "city": city.text,
      "state": selectedState,
      "pinCode": pinCode.text,
      "password": "destination@2020",
    };
    Map<String, String> header = {
      "x-api-key": ApiUrls().apiKey,
    };
    final response = await apiService.postApi(
      url: '${ApiUrls().baseUrl}saveCustomer',
      body: data,
      header: header,
      context: context,
      isLoading: true,
    );
    print("SAVE CUSTOMER RESPONSE");
    Logger().d(response);
    Navigator.pop(context);
    if (response != null) {
      if (response["status"] == 200) {
        CommonWidgets()
            .showSnack(context: context, msg: "Profile Updated.");
        customerResponse = CustomerResponse.fromJson(response);
        if(customerResponse!.result!.status == "1") {
          login(context: context,mob: customerResponse!.result!.phoneNumber!);
        }
        print("@@@@@@@@@@@@@@@@@@@@@ SUCCESS @@@@@@@@@@@@@@@@@@@@@@");
      } else {
        CommonWidgets()
            .showSnack(context: context, msg: response["message"]);
        print("@@@@@@@@@@@@@@@@@@@@@ FAIL @@@@@@@@@@@@@@@@@@@@@@");
      }
    }
    notifyListeners();
  }

}
