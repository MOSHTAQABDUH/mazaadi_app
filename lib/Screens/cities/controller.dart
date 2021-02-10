import 'package:projects/Helpers/network.dart';
import 'package:projects/Screens/cities/model.dart';

class CityController {
  NetWork _netWork = NetWork();
  CityModel _cityModel = CityModel();

  Future<CityModel> getCity() async {
    var data = await _netWork.getData(url: 'cities');
    _cityModel = CityModel.fromJson(data);
    return _cityModel;
  }
}
