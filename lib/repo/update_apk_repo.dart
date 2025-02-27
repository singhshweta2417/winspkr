import 'package:flutter/foundation.dart';
import 'package:fomoplay/helper/network/base_api_services.dart';
import 'package:fomoplay/res/api_urls.dart';


import '../helper/network/network_api_services.dart';

class UpdateApkRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> updateApkApi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.versionUpdate);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during updateApkApi: $e');
      }
      rethrow;
    }
  }
}