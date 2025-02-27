import 'package:flutter/foundation.dart';
import 'package:fomoplay/helper/network/base_api_services.dart';
import 'package:fomoplay/helper/network/network_api_services.dart';
import 'package:fomoplay/model/vip_reward_his_model.dart';
import 'package:fomoplay/res/api_urls.dart';


class VipRewardHisRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<VipRewardHisModel> vipRewardHisApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.vipRewardHis+data);
      return VipRewardHisModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during vipRewardHisApi: $e');
      }
      rethrow;
    }
  }
}