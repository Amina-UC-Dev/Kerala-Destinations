// To parse this JSON data, do
//
//     final destinationTypesResponse = destinationTypesResponseFromJson(jsonString);

import 'dart:convert';

DestinationTypesResponse destinationTypesResponseFromJson(String str) => DestinationTypesResponse.fromJson(json.decode(str));

String destinationTypesResponseToJson(DestinationTypesResponse data) => json.encode(data.toJson());

class DestinationTypesResponse {
  DestinationTypesResponse({
    this.status,
    this.result,
    this.message,
  });

  int? status;
  List<DestinationTypeData>? result;
  String? message;

  factory DestinationTypesResponse.fromJson(Map<String, dynamic> json) => DestinationTypesResponse(
    status: json["status"],
    result: List<DestinationTypeData>.from(json["result"].map((x) => DestinationTypeData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "message": message,
  };
}

class DestinationTypeData {
  DestinationTypeData({
    this.destinationTypeId,
    this.destinationType,
    this.parentDestinationTypeId,
    this.isRouteType,
    this.status,
  });

  String? destinationTypeId;
  String? destinationType;
  String? parentDestinationTypeId;
  String? isRouteType;
  String? status;

  factory DestinationTypeData.fromJson(Map<String, dynamic> json) => DestinationTypeData(
    destinationTypeId: json["destinationTypeId"],
    destinationType: json["destinationType"],
    parentDestinationTypeId: json["parentDestinationTypeId"],
    isRouteType: json["isRouteType"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "destinationTypeId": destinationTypeId,
    "destinationType": destinationType,
    "parentDestinationTypeId": parentDestinationTypeId,
    "isRouteType": isRouteType,
    "status": status,
  };
}

class States {
  States({
    this.stateId,
    this.countryId,
    this.stateName,
    this.status,
  });

  String? stateId;
  String? countryId;
  String? stateName;
  String? status;

  factory States.fromJson(Map<String, dynamic> json) => States(
    stateId: json["stateId"],
    countryId: json["countryId"],
    stateName: json["stateName"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "stateId": stateId,
    "countryId": countryId,
    "stateName": stateName,
    "status": status,
  };
}
