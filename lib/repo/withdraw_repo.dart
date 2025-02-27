import 'package:flutter/foundation.dart';
import 'package:fomoplay/helper/network/base_api_services.dart';
import 'package:fomoplay/helper/network/network_api_services.dart';
import 'package:fomoplay/model/withdraw_history_model.dart';
import 'package:fomoplay/res/api_urls.dart';

class WithdrawRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> withdrawApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(ApiUrl.withdraw , data);
      return response;
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during withdrawApi: $e');
      }
      rethrow;
    }
  }

  Future<WithdrawHistoryModel> withdrawHistoryApi(dynamic userId, dynamic type) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse("${ApiUrl.withdrawHistory}$userId&type=$type");
      return WithdrawHistoryModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during withdrawHistoryApi: $e');
      }
      rethrow;
    }
  }


}