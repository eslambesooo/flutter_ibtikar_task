import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import '../../../network/network_helper.dart';
import '../../../utils/infinite_scroll_grid.dart';
import '../controllers/home_controller.dart';
import 'grid_item_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onTap: () async {
              EasyLoading.show();
              var data = await controller.networkHelper.getPopularList(1);
              EasyLoading.dismiss();
              print(data.body);
              print(data.request!.url.toString());
            },
            child: Text('Flutter Test')),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          return InfiniteScrollGrid(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            shrinkWrap: false,
            childAspectRatio: 0.8,
            itemExtent: 100,

            onLoadingStart: (page) async {
              controller.onLoadingStarts(page);
            },
            everythingLoaded: controller.everyThingLoaded.value,
            crossAxisCount: 2,

            children: controller.popularList
                .map(
                  (e) => GridItemView(person: e),
                )
                .toList(),
          );
        }),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String text;

  const GridItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor.withOpacity(.3), borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CircleAvatar(
              child: Icon(Icons.image),
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
