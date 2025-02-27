import 'package:flutter/foundation.dart';
import 'package:fomoplay/helper/network/base_api_services.dart';
import 'package:fomoplay/helper/network/network_api_services.dart';
import 'package:fomoplay/model/customer_service_model.dart';
import 'package:fomoplay/res/api_urls.dart';

class CustomerServiceRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<CustomerServiceModel> customerServiceApi() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(ApiUrl.customerService);
      return CustomerServiceModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during customerServiceApi: $e');
      }
      rethrow;
    }
  }
}
