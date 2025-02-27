import 'package:flutter/foundation.dart';
import 'package:fomoplay/helper/network/base_api_services.dart';
import 'package:fomoplay/helper/network/network_api_services.dart';
import 'package:fomoplay/view/wingo/model/win_go_result_model.dart';
import 'package:fomoplay/view/wingo/res/win_go_api_url.dart';

class WinGoResultRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<WinGoResultModel> gameResultApi(context, dynamic data) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(WinGoApiUrl.winGoLastResult+data);
      return WinGoResultModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during gameResultApi: $e');
      }
      rethrow;
    }
  }
}