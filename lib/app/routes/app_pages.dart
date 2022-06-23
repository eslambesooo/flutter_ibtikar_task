import 'package:get/get.dart';

import '../modules/ImagePreview/bindings/image_preview_binding.dart';
import '../modules/ImagePreview/views/image_preview_view.dart';
import '../modules/detailsPage/bindings/details_page_binding.dart';
import '../modules/detailsPage/views/details_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS_PAGE,
      page: () => DetailsPageView(),
      binding: DetailsPageBinding(),
    ),
    GetPage(
      name: _Paths.IMAGE_PREVIEW,
      page: () => ImagePreviewView(),
      binding: ImagePreviewBinding(),
    ),
  ];
}
