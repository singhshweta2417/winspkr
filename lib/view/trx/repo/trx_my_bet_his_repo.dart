import 'package:flutter/foundation.dart';
import 'package:fomoplay/helper/network/base_api_services.dart';
import 'package:fomoplay/helper/network/network_api_services.dart';
import 'package:fomoplay/view/trx/model/trx_my_bet_his_model.dart';
import 'package:fomoplay/view/trx/res/trx_api_url.dart';

class TrxMyBetHisRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<TrxMyBetHisModel> trxMyBetHisApi(dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getPostApiResponse(TrxApiUrl.trxMyBetHis,data);
      return TrxMyBetHisModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during trxMyBetHisApi: $e');
      }
      rethrow;
    }
  }
}