import 'package:dio/dio.dart';
import 'package:projects/Helpers/network.dart';
import 'package:projects/Screens/Login/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  NetWork netWork = NetWork();

  LoginModel _loginModel = LoginModel();

  Future<Map<String, dynamic>> userLogin(
      {String mobile, String password}) async {
    FormData formData = FormData.fromMap({
      "phone": mobile,
      "password": password,
    });
    var response = await netWork.postData(url: '/login', formData: formData);
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
      _loginModel = LoginModel.fromJson(response);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', "Bearer " + _loginModel.data.token);
      prefs.setString('name', _loginModel.data.user.name);
      prefs.setString('email', _loginModel.data.user.email);
      prefs.setString('image', _loginModel.data.user.avatar);
      prefs.setString('cityName', _loginModel.data.user.city.name.ar);
      prefs.setInt('cityId', _loginModel.data.user.city.id);

      return {
        "result": _loginModel.message,
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
