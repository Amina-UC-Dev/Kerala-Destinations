// To parse this JSON data, do
//
//     final destinationDetailResponse = destinationDetailResponseFromJson(jsonString);

import 'dart:convert';

DestinationDetailResponse destinationDetailResponseFromJson(String str) => DestinationDetailResponse.fromJson(json.decode(str));

String destinationDetailResponseToJson(DestinationDetailResponse data) => json.encode(data.toJson());

class DestinationDetailResponse {
  DestinationDetailResponse({
    this.status,
    this.result,
    this.message,
  });

  int? status;
  DestinationDetail? result;
  String? message;

  factory DestinationDetailResponse.fromJson(Map<String, dynamic> json) => DestinationDetailResponse(
    status: json["status"],
    result: DestinationDetail.fromJson(json["result"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": result!.toJson(),
    "message": message,
  };
}

class DestinationDetail {
  DestinationDetail({
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
    this.altitude,
    this.latitude,
    this.longitude,
    this.addedBy,
    this.seoUrl,
    this.modifiedDate,
    this.createdDate,
    this.destinationLocalId,
    this.destinationImageUrl1,
    this.destinationImageUrl2,
    this.destinationImageUrl3,
    this.destinationImageUrl4,
    this.status,
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
  String? altitude;
  String? latitude;
  String? longitude;
  String? addedBy;
  String? seoUrl;
  DateTime? modifiedDate;
  DateTime? createdDate;
  String? destinationLocalId;
  String? destinationImageUrl1;
  String? destinationImageUrl2;
  String? destinationImageUrl3;
  String? destinationImageUrl4;
  String? status;

  factory DestinationDetail.fromJson(Map<String, dynamic> json) => DestinationDetail(
    destinationId: json["destinationId"],
    destinationName: json["destinationName"],
    localName: json["localName"],
    destinationTypeNames: json["destinationTypeNames"],
    cityName: json["cityName"],
    provinceName: json["provinceName"],
    countryName: json["countryName"],
    postalCode: json["postalCode"],
    destinationPhoto: json["destinationPhoto"] ?? "",
    destinationPhotoCourtesy: json["destinationPhotoCourtesy"] ?? "",
    destinationDescription: json["destinationDescription"],
    bestSeason: json["bestSeason"],
    destinationAttractions: json["destinationAttractions"],
    altitude: json["altitude"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    addedBy: json["addedBy"],
    seoUrl: json["seoUrl"],
    modifiedDate: DateTime.parse(json["modifiedDate"]),
    createdDate: DateTime.parse(json["createdDate"]),
    destinationLocalId: json["destinationLocalId"],
    destinationImageUrl1: json["destinationImageURL1"],
    destinationImageUrl2: json["destinationImageURL2"],
    destinationImageUrl3: json["destinationImageURL3"],
    destinationImageUrl4: json["destinationImageURL4"],
    status: json["status"],
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
    "altitude": altitude,
    "latitude": latitude,
    "longitude": longitude,
    "addedBy": addedBy,
    "seoUrl": seoUrl,
    "modifiedDate": modifiedDate!.toIso8601String(),
    "createdDate": createdDate!.toIso8601String(),
    "destinationLocalId": destinationLocalId,
    "destinationImageURL1": destinationImageUrl1,
    "destinationImageURL2": destinationImageUrl2,
    "destinationImageURL3": destinationImageUrl3,
    "destinationImageURL4": destinationImageUrl4,
    "status": status,
  };
}
