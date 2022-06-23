import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../ImagePreview/views/image_preview_view.dart';
import '../controllers/details_page_controller.dart';

class DetailsPageView extends GetView<DetailsPageController> {
  @override
  Widget build(BuildContext context) {
    Get.put(DetailsPageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.detailsResponse.name!),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.blueGrey.shade300,
            //height: Get.height,
            width: Get.width,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min
              ,
              children: [
                Column(
                   mainAxisSize: MainAxisSize.max,
                  children: [
                    controller.detailsResponse.profilePath != null ? CachedNetworkImage(imageUrl:  kImageBase + kthumbSize +controller.detailsResponse.profilePath!,fit: BoxFit.fill, height: Get.height*0.3,):SvgPicture.network(
                      kDefaultImage,
                      height: Get.height*0.3,

                      placeholderBuilder: (BuildContext context) => Container(
                          padding: const EdgeInsets.all(30.0),
                          child: const CircularProgressIndicator()),
                    ),
                    SizedBox(height: 10,),
                    InfoItem(title:"Name",value: controller.detailsResponse.name!,),
                    InfoItem(title:"Birthday",value: controller.detailsResponse.birthday!,),
                    InfoItem(title:"Place Of Birth",value: controller.detailsResponse.placeOfBirth!,),

                    InfoItem(title:"Bio",value: controller.detailsResponse.biography!,),

                  ],
                ),
                Container(width: Get.width,padding:EdgeInsets.all(4),child:  AutoSizeText("Images: ",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),),
                Container(
                  height: Get.height*0.5,
                  child: GridView.count(crossAxisCount: 2,padding: EdgeInsets.all(4),children: controller.imagesResponse.profiles!

                      .map(
                        (e) => InkWell(onTap: (){
Get.to(()=>ImagePreviewView(imageUrl: kImageBase + kOriginalSize +e.filePath!,name: controller.detailsResponse.name!,));


                    },child: Container(padding: EdgeInsets.all(4),child: CachedNetworkImage(imageUrl:  kImageBase + kthumbSize +e.filePath!,),)),
                  )
                      .toList(),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({
    Key? key,
    required this.title,
    required this.value
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(
        children: [
          Row(
            children: [

              Text("$title: ",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              Expanded(child: AutoSizeText(value,style:TextStyle(fontSize: 20),textAlign: TextAlign.start,)),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
