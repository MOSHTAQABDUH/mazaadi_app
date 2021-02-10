class LoginModel {
  bool success;
  Data data;
  String message;

  LoginModel({this.success, this.data, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  User user;
  String token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int id;
  String name;
  String email;
  String avatar;
  String phone;
  Null averageRating;
  String deviceId;
  String lat;
  String lng;
  String type;
  City city;
  Null phoneVerifiedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.avatar,
      this.phone,
      this.averageRating,
      this.deviceId,
      this.lat,
      this.lng,
      this.type,
      this.city,
      this.phoneVerifiedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    phone = json['phone'];
    averageRating = json['averageRating'];
    deviceId = json['device_id'];
    lat = json['lat'];
    lng = json['lng'];
    type = json['type'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    phoneVerifiedAt = json['phone_verified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['phone'] = this.phone;
    data['averageRating'] = this.averageRating;
    data['device_id'] = this.deviceId;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['type'] = this.type;
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    data['phone_verified_at'] = this.phoneVerifiedAt;
    return data;
  }
}

class City {
  int id;
  Name name;
  int countryId;
  String createdAt;
  String updatedAt;

  City({this.id, this.name, this.countryId, this.createdAt, this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    countryId = json['country_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    data['country_id'] = this.countryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Name {
  String ar;
  String en;

  Name({this.ar, this.en});

  Name.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['en'] = this.en;
    return data;
  }
}
