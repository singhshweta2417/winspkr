import 'package:flutter/foundation.dart';
import 'package:fomoplay/helper/network/base_api_services.dart';
import 'package:fomoplay/helper/network/network_api_services.dart';
import 'package:fomoplay/model/promotion_model.dart';
import 'package:fomoplay/res/api_urls.dart';

class PromotionRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<PromotionDataModel> promotionApi(dynamic userId) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse("${ApiUrl.promotionScreen}$userId");
      return PromotionDataModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during promotionApi: $e');
      }
      rethrow;
    }
  }

}