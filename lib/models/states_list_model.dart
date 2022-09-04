// To parse this JSON data, do
//
//     final states = statesFromJson(jsonString);

import 'dart:convert';

States statesFromJson(String str) => States.fromJson(json.decode(str));

String statesToJson(States data) => json.encode(data.toJson());

class States {
  States({
    this.status,
    this.result,
    this.message,
  });

  int? status;
  List<StateData>? result;
  String? message;

  factory States.fromJson(Map<String, dynamic> json) => States(
    status: json["status"],
    result: List<StateData>.from(json["result"].map((x) => StateData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "message": message,
  };
}

class StateData {
  StateData({
    this.stateId,
    this.countryId,
    this.stateName,
    this.status,
  });

  String? stateId;
  String? countryId;
  String? stateName;
  String? status;

  factory StateData.fromJson(Map<String, dynamic> json) => StateData(
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
