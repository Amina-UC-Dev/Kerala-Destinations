// To parse this JSON data, do
//
//     final destinationListResponse = destinationListResponseFromJson(jsonString);

import 'dart:convert';

DestinationListResponse destinationListResponseFromJson(String str) => DestinationListResponse.fromJson(json.decode(str));

String destinationListResponseToJson(DestinationListResponse data) => json.encode(data.toJson());

class DestinationListResponse {
  DestinationListResponse({
    this.status,
    this.result,
    this.totalRows,
    this.message,
  });

  int? status;
  List<DestinationD>? result;
  int? totalRows;
  String? message;

  factory DestinationListResponse.fromJson(Map<String, dynamic> json) => DestinationListResponse(
    status: json["status"],
    result: List<DestinationD>.from(json["result"].map((x) => DestinationD.fromJson(x))),
    totalRows: json["totalRows"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "totalRows": totalRows,
    "message": message,
  };
}

class DestinationD {
  DestinationD({
    this.destinationId,
    this.destinationName,
    this.localName,
    this.destinationTypeNames,
    this.cityName,
    this.provinceName,
    this.countryName,
    this.postalCode,
    this.destinationPhoto,
    this.destinationPhotoCourtesy,
    this.destinationDescription,
    this.bestSeason,
    this.destinationAttractions,
    this.latitude,
    this.longitude,
    this.altitude,
    this.addedBy,
    this.seoUrl,
    this.modifiedDate,
    this.createdDate,
    this.destinationLocalId,
    this.status,
    this.distance,
  });

  String? destinationId;
  String? destinationName;
  String? localName;
  String? destinationTypeNames;
  String? cityName;
  String? provinceName;
  String? countryName;
  String? postalCode;
  String? destinationPhoto;
  String? destinationPhotoCourtesy;
  String? destinationDescription;
  String? bestSeason;
  String? destinationAttractions;
  String? latitude;
  String? longitude;
  String? altitude;
  String? addedBy;
  String? seoUrl;
  String? modifiedDate;
  DateTime? createdDate;
  String? destinationLocalId;
  String? status;
  String? distance;

  factory DestinationD.fromJson(Map<String, dynamic> json) => DestinationD(
    destinationId: json["destinationId"],
    destinationName: json["destinationName"],
    localName: json["localName"],
    destinationTypeNames: json["destinationTypeNames"],
    cityName: json["cityName"],
    provinceName: json["provinceName"],
    countryName: json["countryName"],
    postalCode: json["postalCode"],
    destinationPhoto: json["destinationPhoto"],
    destinationPhotoCourtesy: json["destinationPhotoCourtesy"],
    destinationDescription: json["destinationDescription"],
    bestSeason: json["bestSeason"],
    destinationAttractions: json["destinationAttractions"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    altitude: json["altitude"],
    addedBy: json["addedBy"],
    seoUrl: json["seoUrl"],
    modifiedDate: json["modifiedDate"],
    createdDate: DateTime.parse(json["createdDate"]),
    destinationLocalId: json["destinationLocalId"],
    status: json["status"],
    distance: json["distance"],
  );

  Map<String, dynamic> toJson() => {
    "destinationId": destinationId,
    "destinationName": destinationName,
    "localName": localName,
    "destinationTypeNames": destinationTypeNames,
    "cityName": cityName,
    "provinceName": provinceName,
    "countryName": countryName,
    "postalCode": postalCode,
    "destinationPhoto": destinationPhoto,
    "destinationPhotoCourtesy": destinationPhotoCourtesy,
    "destinationDescription": destinationDescription,
    "bestSeason": bestSeason,
    "destinationAttractions": destinationAttractions,
    "latitude": latitude,
    "longitude": longitude,
    "altitude": altitude,
    "addedBy": addedBy,
    "seoUrl": seoUrl,
    "modifiedDate": modifiedDate,
    "createdDate": createdDate!.toIso8601String(),
    "destinationLocalId": destinationLocalId,
    "status": status,
    "distance": distance ,
  };
}

class DestinationLD {
  DestinationLD({
    this.destinationId,
    this.destinationName,
    this.localName,
    this.destinationTypeNames,
    this.cityName,
    this.provinceName,
    this.countryName,
    this.postalCode,
    this.destinationPhoto,
    this.destinationImageURL1,
    this.destinationImageURL2,
    this.destinationImageURL3,
    this.destinationImageURL4,
    this.destinationPhotoCourtesy,
    this.destinationDescription,
    this.bestSeason,
    this.destinationAttractions,
    this.latitude,
    this.longitude,
    this.createdDate,
    this.localId,
    this.customerId,
    this.deviceRegistrationId,
  });

  String? destinationId;
  String? destinationName;
  String? customerId;
  String? deviceRegistrationId;
  String? localName;
  String? destinationTypeNames;
  String? cityName;
  String? provinceName;
  String? countryName;
  String? postalCode;
  String? destinationPhoto;
  String? destinationPhotoCourtesy;
  String? destinationDescription;
  String? bestSeason;
  String? destinationAttractions;
  String? latitude;
  String? longitude;
  String? createdDate;
  String? localId;
  String? destinationImageURL1;
  String? destinationImageURL2;
  String? destinationImageURL3;
  String? destinationImageURL4;

  factory DestinationLD.fromJson(Map<String, dynamic> json) => DestinationLD(
    destinationId: json["destinationId"],
    localId: json["localId"],
    customerId: json["customerId"],
    deviceRegistrationId: json["deviceRegistrationId"],
    destinationName: json["destinationName"],
    localName: json["localName"],
    destinationTypeNames: json["destinationTypeNames"],
    cityName: json["cityName"],
    provinceName: json["provinceName"],
    countryName: json["countryName"],
    postalCode: json["postalCode"],
    destinationPhoto: json["destinationPhoto"],
    destinationImageURL1: json["destinationImageURL1"],
    destinationImageURL2: json["destinationImageURL2"],
    destinationImageURL3: json["destinationImageURL3"],
    destinationImageURL4: json["destinationImageURL4"],
    destinationPhotoCourtesy: json["destinationPhotoCourtesy"],
    destinationDescription: json["destinationDescription"],
    bestSeason: json["bestSeason"],
    destinationAttractions: json["destinationAttractions"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    createdDate: json["createdDate"],
  );

  Map<String, dynamic> toJson() => {
    "destinationId": destinationId,
    "localId": localId,
    "customerId": customerId,
    "deviceRegistrationId": deviceRegistrationId,
    "destinationName": destinationName,
    "localName": localName,
    "destinationTypeNames": destinationTypeNames,
    "cityName": cityName,
    "provinceName": provinceName,
    "countryName": countryName,
    "postalCode": postalCode,
    "destinationPhoto": destinationPhoto,
    "destinationImageURL1": destinationImageURL1,
    "destinationImageURL2": destinationImageURL2,
    "destinationImageURL3": destinationImageURL3,
    "destinationImageURL4": destinationImageURL4,
    "destinationPhotoCourtesy": destinationPhotoCourtesy,
    "destinationDescription": destinationDescription,
    "bestSeason": bestSeason,
    "destinationAttractions": destinationAttractions,
    "latitude": latitude,
    "longitude": longitude,
    "createdDate": createdDate,
  };
}
