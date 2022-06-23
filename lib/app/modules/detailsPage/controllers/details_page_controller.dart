import 'package:get/get.dart';

import '../../../data/details_response_model.dart';
import '../../../data/images_response_model.dart';

class DetailsPageController extends GetxController {

  late DetailsResponse detailsResponse ;
  late ImagesResponse imagesResponse ;

  @override
  void onInit() {
    detailsResponse = Get.arguments['detailsResponse'];
    imagesResponse = Get.arguments['imagesResponse'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

}
