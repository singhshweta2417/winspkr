import 'package:flutter/foundation.dart';
import 'package:fomoplay/helper/network/base_api_services.dart';
import 'package:fomoplay/helper/network/network_api_services.dart';
import 'package:fomoplay/model/subordinate_tier_model.dart';
import 'package:fomoplay/res/api_urls.dart';

class SubordinateTierRepository{
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<SubordinateTierModel> subordinateTierApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.getTier);
      return SubordinateTierModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during subordinateTierApi: $e');
      }
      rethrow;
    }
  }

}