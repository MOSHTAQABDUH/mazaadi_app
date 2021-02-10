import 'dart:convert';

FavoritesModel currentAuctionsFromJson(String str) =>
    FavoritesModel.fromJson(json.decode(str));

String currentAuctionsToJson(FavoritesModel data) => json.encode(data.toJson());

class FavoritesModel {
  FavoritesModel({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  Data data;
  String message;

  factory FavoritesModel.fromJson(Map<String, dynamic> json) => FavoritesModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.auctionId,
    this.createdAt,
    this.updatedAt,
    this.auctions,
  });

  int id;
  int userId;
  int auctionId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Auction> auctions;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        auctionId: json["auction_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        auctions: List<Auction>.from(
            json["auctions"].map((x) => Auction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "auction_id": auctionId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "auctions": List<dynamic>.from(auctions.map((x) => x.toJson())),
      };
}

class Auction {
  Auction({
    this.id,
    this.name,
    this.phone,
    this.lat,
    this.lng,
    this.locationName,
    this.ownerName,
    this.status,
    this.details,
    this.startPrice,
    this.userId,
    this.cityId,
    this.countryId,
    this.categoryId,
    this.primaryImage,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String phone;
  String lat;
  String lng;
  String locationName;
  String ownerName;
  String status;
  String details;
  String startPrice;
  int userId;
  String cityId;
  String countryId;
  String categoryId;
  String primaryImage;
  DateTime createdAt;
  DateTime updatedAt;

  factory Auction.fromJson(Map<String, dynamic> json) => Auction(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        lat: json["lat"],
        lng: json["lng"],
        locationName: json["location_name"],
        ownerName: json["owner_name"],
        status: json["status"],
        details: json["details"],
        startPrice: json["start_price"],
        userId: json["user_id"],
        cityId: json["city_id"],
        countryId: json["country_id"],
        categoryId: json["category_id"],
        primaryImage: json["primary_image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "lat": lat,
        "lng": lng,
        "location_name": locationName,
        "owner_name": ownerName,
        "status": status,
        "details": details,
        "start_price": startPrice,
        "user_id": userId,
        "city_id": cityId,
        "country_id": countryId,
        "category_id": categoryId,
        "primary_image": primaryImage,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
