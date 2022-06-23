
import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ibtikar_task/app/modules/home/popular_list_response_model.dart';
import 'package:flutter_ibtikar_task/app/network/network_helper.dart';
import 'package:get/get.dart';
import 'dart:developer';

import '../../../data/details_response_model.dart';
import '../../../data/images_response_model.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final popularList = <Person>[].obs;
  final everyThingLoaded = false.obs;
  final currentPage = 1.obs;
  final totalPages = 100.obs;
  NetworkHelper networkHelper = NetworkHelper();
  @override
  void onInit() async {
    super.onInit();

    List<Person> initList = await getNextPageData(currentPage.value);
    popularList.addAll(initList);
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<List<Person>> getNextPageData(int page) async {
    EasyLoading.show();
    if (page == (totalPages.value + 1)) {
      EasyLoading.dismiss();
      return [];
    }
    Response response = await networkHelper.getPopularList(page);

    PopularListResponse popularListResponse = PopularListResponse.fromJson(response.body);
    totalPages.value = popularListResponse.totalPages ?? 500;
    EasyLoading.dismiss();
    currentPage.value++;
    return popularListResponse.persons ?? [];
  }

  onLoadingStarts(int newPage) async {
    //page.value = newPage;
    List<Person>? newData = await getNextPageData(currentPage.value);
    if (newData.isEmpty) {
      everyThingLoaded.value = true;
    } else {
      log(jsonEncode(newData.first.toJson()));
      popularList.addAll(newData);
    }
  }

  Future getPersonDetails(int id) async {
    EasyLoading.show();

    Response response = await networkHelper.getDetails(id.toString());
    Response response2 = await networkHelper.getPersonImages(id.toString());
    DetailsResponse detailsResponse = DetailsResponse.fromJson(response.body);
    ImagesResponse imagesResponse = ImagesResponse.fromJson(response2.body);

    EasyLoading.dismiss();
    Get.toNamed(Routes.DETAILS_PAGE,arguments: {"detailsResponse":detailsResponse,"imagesResponse":imagesResponse});
  }

  @override
  void onClose() {}
}
