
import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ibtikar_task/app/modules/home/popular_list_response_model.dart';
import 'package:flutter_ibtikar_task/app/network/network_helper.dart';
import 'package:get/get.dart';
import 'dart:developer';

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

  @override
  void onClose() {}
}
