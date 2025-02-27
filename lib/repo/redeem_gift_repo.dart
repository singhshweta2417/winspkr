import 'package:flutter/foundation.dart';
import 'package:fomoplay/helper/network/base_api_services.dart';
import 'package:fomoplay/helper/network/network_api_services.dart';
import 'package:fomoplay/res/api_urls.dart';

class RedeemGiftRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> redeemGiftApi(dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getPostApiResponse(ApiUrl.redeemGift,data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during redeemGiftApi: $e');
      }
      rethrow;
    }
  }
}