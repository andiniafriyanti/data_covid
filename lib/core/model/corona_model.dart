import 'dart:convert';

List<CoronaModel> coronaModelFromJson(dynamic str) =>
    List<CoronaModel>.from(str.map((x) => CoronaModel.fromJson(x)));

String coronaModelToJson(List<CoronaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoronaModel {
  CoronaModel({
    this.attributes,
  });

  Attributes? attributes;

  factory CoronaModel.fromJson(Map<String, dynamic> json) => CoronaModel(
    attributes: json["attributes"] == null
        ? null
        : Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "attributes": attributes == null ? null : attributes!.toJson(),
  };
}

class Attributes {
  Attributes({
    this.objectid,
    this.countryRegion,
    this.lastUpdate,
    this.lat,
    this.long,
    this.confirmed,
    this.deaths,
    this.recovered,
    this.active,
  });

  int? objectid;
  String? countryRegion;
  int? lastUpdate;
  double? lat;
  double? long;
  int? confirmed;
  int? deaths;
  dynamic recovered;
  dynamic active;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    objectid: json["OBJECTID"] == null ? null : json["OBJECTID"],
    countryRegion:
    json["Country_Region"] == null ? null : json["Country_Region"],
    lastUpdate: json["Last_Update"] == null ? null : json["Last_Update"],
    lat: json["Lat"] == null ? null : json["Lat"].toDouble(),
    long: json["Long_"] == null ? null : json["Long_"].toDouble(),
    confirmed: json["Confirmed"] == null ? null : json["Confirmed"],
    deaths: json["Deaths"] == null ? null : json["Deaths"],
    recovered: json["Recovered"],
    active: json["Active"],
  );

  Map<String, dynamic> toJson() => {
    "OBJECTID": objectid == null ? null : objectid,
    "Country_Region": countryRegion == null ? null : countryRegion,
    "Last_Update": lastUpdate == null ? null : lastUpdate,
    "Lat": lat == null ? null : lat,
    "Long_": long == null ? null : long,
    "Confirmed": confirmed == null ? null : confirmed,
    "Deaths": deaths == null ? null : deaths,
    "Recovered": recovered,
    "Active": active,
  };
}
