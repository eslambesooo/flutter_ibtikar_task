import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../data/person_model.dart';
import '../../../utils/constants.dart';

class GridItemView extends GetView {
  final Person person;

  GridItemView({required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Positioned.fill(
              child: person.profilePath != null
                  ? CachedNetworkImage(
                      imageUrl: kImageBase + kthumbSize + person.profilePath!,
                      fit: BoxFit.fill,
                    )
                  : SvgPicture.network(
                      kDefaultImage,
                      placeholderBuilder: (BuildContext context) => Container(padding: const EdgeInsets.all(30.0), child: const CircularProgressIndicator()),
                    )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black45,
              padding: EdgeInsets.all(6),
              width: Get.width,
              child: Text(
                person.name ?? "",
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
