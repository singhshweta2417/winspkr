import 'package:flutter/foundation.dart';
import 'package:fomoplay/helper/network/base_api_services.dart';
import 'package:fomoplay/helper/network/network_api_services.dart';
import 'package:fomoplay/view/trx/res/trx_api_url.dart';

class TrxBetRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> trxAddBet(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(TrxApiUrl.trxBet, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during trxAddBet: $e');
      }
      rethrow;
    }
  }
}