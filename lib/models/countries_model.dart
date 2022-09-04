class Country {
  Country({
    this.countryId,
    this.countryName,
    this.countryCode,
  });

  String? countryId;
  String? countryName;
  String? countryCode;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    countryId: json["countryId"],
    countryName: json["countryName"],
    countryCode: json["countryCode"],
  );

  Map<String, dynamic> toJson() => {
    "countryId": countryId,
    "countryName": countryName,
    "countryCode": countryCode,
  };
}
