import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

import '../modules/home/popular_list_response_model.dart';
import '../utils/constants.dart';

class NetworkHelper extends GetConnect {
  // Get request
  Future<Response> getPopularList(int page) => get('$kBaseUrl/person/popular?api_key=$kApiKey&language=${Get.deviceLocale!.languageCode.toLowerCase()}&page=$page');
  Future<Response> getDetails(String personId) => get('$kBaseUrl/person/$personId?api_key=$kApiKey&language=${Get.deviceLocale!.languageCode.toLowerCase()}');
  Future<Response> getPersonImages(String personId) => get('$kBaseUrl/person/$personId/images?api_key=$kApiKey&language=${Get.deviceLocale!.languageCode.toLowerCase()}');
}
