import 'package:projects/Helpers/network.dart';
import 'package:projects/Screens/currentAuctions/model.dart';

class CurrentAuctionsController {
  NetWork _netWork = NetWork();
  CurrentAuctionsModel _currentAuctionsModel = CurrentAuctionsModel();
  Future<CurrentAuctionsModel> getCurrentAuctions() async {
    var data = await _netWork.getData(
      url: 'auctions',
    );
    _currentAuctionsModel = CurrentAuctionsModel.fromJson(data);
    return _currentAuctionsModel;
  }
}
