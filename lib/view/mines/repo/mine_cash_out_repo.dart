import 'package:flutter/foundation.dart';
import 'package:fomoplay/helper/network/base_api_services.dart';
import 'package:fomoplay/helper/network/network_api_services.dart';
import 'package:fomoplay/view/mines/res/mine_api_url.dart';

class MineCashOutRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> mineCashOutApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(MineApiUrl.mineCashOut, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during mineCashOutApi: $e');
      }
      rethrow;
    }
  }
}