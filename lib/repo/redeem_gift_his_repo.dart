import 'package:flutter/foundation.dart';
import 'package:fomoplay/helper/network/base_api_services.dart';
import 'package:fomoplay/helper/network/network_api_services.dart';
import 'package:fomoplay/model/redeem_gift_his_model.dart';
import 'package:fomoplay/res/api_urls.dart';

class RedeemGiftHisRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<RedeemGiftHisModel> redeemGiftHisApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(ApiUrl.redeemGiftHis + data);
      return RedeemGiftHisModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during redeemGiftHisApi: $e');
      }
      rethrow;
    }
  }
}
