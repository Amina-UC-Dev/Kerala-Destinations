// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.status,
    this.token,
    this.result,
    this.message,
  });

  int? status;
  String? token;
  UserData? result;
  String? message;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    token: json["token"],
    result: UserData.fromJson(json["result"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "token": token,
    "result": result!.toJson(),
    "message": message,
  };
}

class UserData {
  UserData({
    this.customerId,
    this.customerName,
    this.emailId,
    this.phoneNumber,
    this.address,
    this.city,
    this.state,
    this.pinCode,
    this.password,
    this.createdDate,
    this.modifiedDate,
    this.customerOtp,
    this.otpVerified,
    this.firebaseId,
    this.status,
  });

  String? customerId;
  String? customerName;
  String? emailId;
  String? phoneNumber;
  String? address;
  String? city;
  String? state;
  String? pinCode;
  String? password;
  DateTime? createdDate;
  DateTime? modifiedDate;
  String? customerOtp;
  String? otpVerified;
  String? firebaseId;
  String? status;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    customerId: json["customerId"],
    customerName: json["customerName"],
    emailId: json["emailId"],
    phoneNumber: json["phoneNumber"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    pinCode: json["pinCode"],
    password: json["password"],
    createdDate: DateTime.parse(json["createdDate"]),
    modifiedDate: DateTime.parse(json["modifiedDate"]),
    customerOtp: json["customerOTP"],
    otpVerified: json["otpVerified"],
    firebaseId: json["firebaseId"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "customerId": customerId,
    "customerName": customerName,
    "emailId": emailId,
    "phoneNumber": phoneNumber,
    "address": address,
    "city": city,
    "state": state,
    "pinCode": pinCode,
    "password": password,
    "createdDate": createdDate!.toIso8601String(),
    "modifiedDate": modifiedDate!.toIso8601String(),
    "customerOTP": customerOtp,
    "otpVerified": otpVerified,
    "firebaseId": firebaseId,
    "status": status,
  };
}
