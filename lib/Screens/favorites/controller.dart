import 'package:projects/Helpers/network.dart';
import 'package:projects/Screens/favorites/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesController {
  NetWork _netWork = NetWork();

  FavoritesModel _favoritesModel = FavoritesModel();

  Future<FavoritesModel> getFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    List<Map<String, dynamic>> _headers = [
      {'Authorization': prefs.getString('token')}
    ];
    var data = await _netWork.getData(url: 'favorites', headers: _headers);
    _favoritesModel = FavoritesModel.fromJson(data);
    return _favoritesModel;
  }
}
