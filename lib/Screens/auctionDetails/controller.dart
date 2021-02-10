import 'package:projects/Helpers/network.dart';

class AuctionDetailsController {
  NetWork _netWork = NetWork();

  Future<dynamic> getAuctionDetails() async {
    var data = await _netWork.getData(url: '');
  }
}
