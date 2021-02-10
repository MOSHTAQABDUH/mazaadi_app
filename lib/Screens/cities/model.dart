import 'dart:convert';

CityModel currentAuctionsFromJson(String str) =>
    CityModel.fromJson(json.decode(str));

String currentAuctionsToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.countryId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  Name name;
  int countryId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: Name.fromJson(json["name"]),
        countryId: json["country_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name.toJson(),
        "country_id": countryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Name {
  Name({
    this.ar,
    this.en,
  });

  String ar;
  String en;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        ar: json["ar"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
      };
}
