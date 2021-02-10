import 'package:dio/dio.dart';
import 'package:projects/Helpers/network.dart';
import 'package:projects/Screens/signUp/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController {
  NetWork netWork = NetWork();

  SignUpModel _signUpModel = SignUpModel();

  Future<Map<String, dynamic>> userSignUp(
      {String name,
      String email,
      String password,
      String confirmPassword,
      String phone,
      String type,
      int cityId,
      String deviceId,
      String lat,
      String long,
      String avatar}) async {
    FormData formData = FormData.fromMap({
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": confirmPassword,
      "phone": phone,
      "type": type,
      "city_id": cityId,
      "device_id": deviceId,
      "lat": lat,
      "lng": long,
      "avatar": avatar
    });
    var response = await netWork.postData(url: '/register', formData: formData);
    print(response);
    if (response == 'not found') {
      return {
        "result": null,
        "err": 'password or user name incorrect',
        "success": false,
      };
    } else if (response == 'internet') {
      return {
        "result": null,
        "err": 'no internet connection',
        "success": false,
      };
    } else if (response == null) {
      return {
        "result": null,
        "err": 'password or user name incorrect',
        "success": false,
      };
    } else if (response['success'] == true) {
      _signUpModel = SignUpModel.fromJson(response);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', "Bearer " + _signUpModel.data.token);
      prefs.setString('name', _signUpModel.data.user.name);
      prefs.setString('email', _signUpModel.data.user.email);
      prefs.setString('image', _signUpModel.data.user.avatar);

      return {
        "result": _signUpModel.message,
        "err": null,
        "success": true,
      };
    } else {
      return {
        "result": null,
        "err": response['msg'],
        "success": false,
      };
    }
  }
}
