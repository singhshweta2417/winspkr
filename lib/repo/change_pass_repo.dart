import 'package:flutter/foundation.dart';
import 'package:fomoplay/helper/network/base_api_services.dart';
import 'package:fomoplay/helper/network/network_api_services.dart';
import 'package:fomoplay/res/api_urls.dart';

class ChangePassRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> changePassApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(ApiUrl.changePassword , data);
      return response;
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during changePassApi: $e');
      }
      rethrow;
    }
  }

}