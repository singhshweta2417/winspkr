import 'package:flutter/foundation.dart';
import 'package:fomoplay/helper/network/base_api_services.dart';
import 'package:fomoplay/helper/network/network_api_services.dart';
import 'package:fomoplay/view/mines/res/mine_api_url.dart';

import '../model/mine_drop_down_model.dart';

class MineDropDownRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<MineDropDownModel> mineMultiplierApi() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(MineApiUrl.mineMultiplier);
      return MineDropDownModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during mineMultiplierApi: $e');
      }
      rethrow;
    }
  }
}
