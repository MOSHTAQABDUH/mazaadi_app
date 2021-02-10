import 'package:projects/Helpers/network.dart';
import 'package:projects/Screens/notifications/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationController {
  NetWork _netWork = NetWork();
  NotificationModel _notificationModel = NotificationModel();

  Future<NotificationModel> getNotification() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    List<Map<String, dynamic>> _headers = [
      {'Authorization': prefs.getString('token')}
    ];

    var data = await _netWork.getData(url: 'notifications', headers: _headers);
    print(data);
    return _notificationModel;
  }
}
