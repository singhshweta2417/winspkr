import 'package:flutter/foundation.dart';
import 'package:fomoplay/helper/network/base_api_services.dart';
import 'package:fomoplay/helper/network/network_api_services.dart';
import 'package:fomoplay/model/slider_modal.dart';
import 'package:fomoplay/res/api_urls.dart';


class SliderRepository{
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<SliderModel> sliderApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.slider);
      return SliderModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during sliderApi: $e');
      }
      rethrow;
    }
  }

}