import 'dart:convert';

CurrentAuctionsModel currentAuctionsFromJson(String str) =>
    CurrentAuctionsModel.fromJson(json.decode(str));

String currentAuctionsToJson(CurrentAuctionsModel data) =>
    json.encode(data.toJson());

class CurrentAuctionsModel {
  CurrentAuctionsModel({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  Data data;
  String message;

  factory CurrentAuctionsModel.fromJson(Map<String, dynamic> json) =>
      CurrentAuctionsModel(
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
  String nextPageUrl;
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
    this.images,
    this.category,
    this.user,
    this.city,
    this.country,
  });

  int id;
  DatumName name;
  String phone;
  String lat;
  String lng;
  LocationName locationName;
  OwnerName ownerName;
  Status status;
  Details details;
  String startPrice;
  int userId;
  String cityId;
  String countryId;
  String categoryId;
  String primaryImage;
  DateTime createdAt;
  DateTime updatedAt;
  List<ImageElement> images;
  Category category;
  User user;
  City city;
  City country;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: datumNameValues.map[json["name"]],
        phone: json["phone"],
        lat: json["lat"],
        lng: json["lng"],
        locationName: locationNameValues.map[json["location_name"]],
        ownerName: ownerNameValues.map[json["owner_name"]],
        status: statusValues.map[json["status"]],
        details: detailsValues.map[json["details"]],
        startPrice: json["start_price"],
        userId: json["user_id"],
        cityId: json["city_id"],
        countryId: json["country_id"],
        categoryId: json["category_id"],
        primaryImage: json["primary_image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        images: List<ImageElement>.from(
            json["images"].map((x) => ImageElement.fromJson(x))),
        category: Category.fromJson(json["category"]),
        user: User.fromJson(json["user"]),
        city: City.fromJson(json["city"]),
        country: City.fromJson(json["country"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": datumNameValues.reverse[name],
        "phone": phone,
        "lat": lat,
        "lng": lng,
        "location_name": locationNameValues.reverse[locationName],
        "owner_name": ownerNameValues.reverse[ownerName],
        "status": statusValues.reverse[status],
        "details": detailsValues.reverse[details],
        "start_price": startPrice,
        "user_id": userId,
        "city_id": cityId,
        "country_id": countryId,
        "category_id": categoryId,
        "primary_image": primaryImage,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "category": category.toJson(),
        "user": user.toJson(),
        "city": city.toJson(),
        "country": country.toJson(),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.image,
    this.pricesRange,
    this.parentId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  NameClass name;
  dynamic image;
  PricesRange pricesRange;
  dynamic parentId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: NameClass.fromJson(json["name"]),
        image: json["image"],
        pricesRange: PricesRange.fromJson(json["prices_range"]),
        parentId: json["parent_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name.toJson(),
        "image": image,
        "prices_range": pricesRange.toJson(),
        "parent_id": parentId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class NameClass {
  NameClass({
    this.ar,
    this.en,
  });

  Ar ar;
  En en;

  factory NameClass.fromJson(Map<String, dynamic> json) => NameClass(
        ar: arValues.map[json["ar"]],
        en: enValues.map[json["en"]],
      );

  Map<String, dynamic> toJson() => {
        "ar": arValues.reverse[ar],
        "en": enValues.reverse[en],
      };
}

enum Ar { EMPTY, AR, PURPLE }

final arValues =
    EnumValues({"المنصورة": Ar.AR, "قسم ١": Ar.EMPTY, "مصر": Ar.PURPLE});

enum En { CATEGORY_1, MANSOURA, EGYPT }

final enValues = EnumValues(
    {"category 1": En.CATEGORY_1, "egypt": En.EGYPT, "mansoura": En.MANSOURA});

class PricesRange {
  PricesRange({
    this.minPrice,
    this.maxPrice,
    this.ranges,
  });

  String minPrice;
  String maxPrice;
  List<int> ranges;

  factory PricesRange.fromJson(Map<String, dynamic> json) => PricesRange(
        minPrice: json["min_price"],
        maxPrice: json["max_price"],
        ranges: List<int>.from(json["ranges"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "min_price": minPrice,
        "max_price": maxPrice,
        "ranges": List<dynamic>.from(ranges.map((x) => x)),
      };
}

class City {
  City({
    this.id,
    this.name,
    this.countryId,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  int id;
  NameClass name;
  int countryId;
  DateTime createdAt;
  DateTime updatedAt;
  ImageEnum image;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: NameClass.fromJson(json["name"]),
        countryId: json["country_id"] == null ? null : json["country_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image:
            json["image"] == null ? null : imageEnumValues.map[json["image"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name.toJson(),
        "country_id": countryId == null ? null : countryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image == null ? null : imageEnumValues.reverse[image],
      };
}

enum ImageEnum {
  COUNTRIES_IM2_B_MZ_UPAW_EY_UC8_NMEBGE52_KE9_Y_MEP_W3_B_I8_C_BK4_A_JPEG
}

final imageEnumValues = EnumValues({
  "countries/im2bMzUpawEYUc8nmebge52ke9yMepW3bI8cBK4A.jpeg": ImageEnum
      .COUNTRIES_IM2_B_MZ_UPAW_EY_UC8_NMEBGE52_KE9_Y_MEP_W3_B_I8_C_BK4_A_JPEG
});

enum Details { EMPTY }

final detailsValues = EnumValues({"تفاصيل المزاد": Details.EMPTY});

class ImageElement {
  ImageElement({
    this.name,
    this.size,
    this.file,
    this.path,
    this.fullFile,
    this.mimeType,
    this.fileType,
    this.relationId,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  ImageName name;
  String size;
  String file;
  Path path;
  String fullFile;
  MimeType mimeType;
  FileType fileType;
  String relationId;
  int id;
  DateTime createdAt;
  DateTime updatedAt;

  factory ImageElement.fromJson(Map<String, dynamic> json) => ImageElement(
        name: imageNameValues.map[json["name"]],
        size: json["size"],
        file: json["file"],
        path: pathValues.map[json["path"]],
        fullFile: json["full_file"],
        mimeType: mimeTypeValues.map[json["mime_type"]],
        fileType: fileTypeValues.map[json["file_type"]],
        relationId: json["relation_id"],
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "name": imageNameValues.reverse[name],
        "size": size,
        "file": file,
        "path": pathValues.reverse[path],
        "full_file": fullFile,
        "mime_type": mimeTypeValues.reverse[mimeType],
        "file_type": fileTypeValues.reverse[fileType],
        "relation_id": relationId,
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum FileType { AUCTION }

final fileTypeValues = EnumValues({"auction": FileType.AUCTION});

enum MimeType { IMAGE_JPEG }

final mimeTypeValues = EnumValues({"image/jpeg": MimeType.IMAGE_JPEG});

enum ImageName { THE_7191493625035128266027386365346780569141248_N_JPG }

final imageNameValues = EnumValues({
  "71914936_2503512826602738_6365346780569141248_n.jpg":
      ImageName.THE_7191493625035128266027386365346780569141248_N_JPG
});

enum Path { AUCTIONS }

final pathValues = EnumValues({"auctions": Path.AUCTIONS});

enum LocationName { EMPTY }

final locationNameValues =
    EnumValues({"اسم الحي من خلال جوجل , او العنوان": LocationName.EMPTY});

enum DatumName { EMPTY }

final datumNameValues =
    EnumValues({"عنوان المزاد او اسم المزاد هنا": DatumName.EMPTY});

enum OwnerName { EMPTY }

final ownerNameValues = EnumValues({"هشام": OwnerName.EMPTY});

enum Status { ON }

final statusValues = EnumValues({"on": Status.ON});

class User {
  User({
    this.id,
    this.name,
    this.phone,
    this.cityId,
    this.avatar,
    this.deviceId,
    this.lat,
    this.lng,
    this.type,
    this.email,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  UserName name;
  String phone;
  String cityId;
  dynamic avatar;
  dynamic deviceId;
  dynamic lat;
  dynamic lng;
  Type type;
  Email email;
  dynamic emailVerifiedAt;
  dynamic phoneVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: userNameValues.map[json["name"]],
        phone: json["phone"],
        cityId: json["city_id"],
        avatar: json["avatar"],
        deviceId: json["device_id"],
        lat: json["lat"],
        lng: json["lng"],
        type: typeValues.map[json["type"]],
        email: emailValues.map[json["email"]],
        emailVerifiedAt: json["email_verified_at"],
        phoneVerifiedAt: json["phone_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": userNameValues.reverse[name],
        "phone": phone,
        "city_id": cityId,
        "avatar": avatar,
        "device_id": deviceId,
        "lat": lat,
        "lng": lng,
        "type": typeValues.reverse[type],
        "email": emailValues.reverse[email],
        "email_verified_at": emailVerifiedAt,
        "phone_verified_at": phoneVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum Email { ADMIN_ADMIN_COM }

final emailValues = EnumValues({"admin@admin.com": Email.ADMIN_ADMIN_COM});

enum UserName { ADMIN }

final userNameValues = EnumValues({"admin": UserName.ADMIN});

enum Type { USER }

final typeValues = EnumValues({"user": Type.USER});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
