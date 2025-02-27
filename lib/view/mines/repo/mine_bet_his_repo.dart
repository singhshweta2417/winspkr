import 'package:flutter/foundation.dart';
import 'package:fomoplay/helper/network/base_api_services.dart';
import 'package:fomoplay/helper/network/network_api_services.dart';
import 'package:fomoplay/view/mines/model/mine_bet_his_model.dart';
import 'package:fomoplay/view/mines/res/mine_api_url.dart';

class MineBetHisRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<MineBetHisModel> mineBetHisApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(MineApiUrl.mineBetHistory+data);
      return MineBetHisModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during mineBetHisApi: $e');
      }
      rethrow;
    }
  }
}