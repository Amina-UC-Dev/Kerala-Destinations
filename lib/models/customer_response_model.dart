// To parse this JSON data, do
//
//     final customerResponse = customerResponseFromJson(jsonString);

import 'dart:convert';

CustomerResponse customerResponseFromJson(String str) => CustomerResponse.fromJson(json.decode(str));

String customerResponseToJson(CustomerResponse data) => json.encode(data.toJson());

class CustomerResponse {
  CustomerResponse({
    this.status,
    this.result,
    this.message,
  });

  int? status;
  Result? result;
  String? message;

  factory CustomerResponse.fromJson(Map<String, dynamic> json) => CustomerResponse(
    status: json["status"],
    result: Result.fromJson(json["result"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": result!.toJson(),
    "message": message,
  };
}

class Result {
  Result({
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
