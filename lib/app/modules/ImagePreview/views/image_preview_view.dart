import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../controllers/image_preview_controller.dart';

class ImagePreviewView extends GetView<ImagePreviewController> {
   ImagePreviewView({this.imageUrl = "", this.name = ""});
  final String imageUrl;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,child:Icon(Icons.save_alt_outlined,size: 40,),elevation: 4,isExtended: true,onPressed: () async {
        EasyLoading.show();
        var response = await Dio().get(
            imageUrl,
            options: Options(responseType: ResponseType.bytes));
        final result = await ImageGallerySaver.saveImage(
            Uint8List.fromList(response.data),
            quality: 100,
            name: "$name-${DateTime.now().millisecond}");

        if(result['isSuccess'] == true)EasyLoading.showSuccess("Image Saved to Gallery");


        EasyLoading.dismiss();
      },),
      body: Center(
        child: Container(height: Get.height,width: Get.width,padding: EdgeInsets.all(16),child: CachedNetworkImage(imageUrl:imageUrl),),
      ),
    );
  }
}
