import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ibtikar_task/app/data/person_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/data/person_model.g.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  //await Hive.openBox<Person>('local');
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      onDispose: () {
        Hive.close();
      },
      onInit: () async {
        Hive.registerAdapter<Person>(PersonAdapter());
        await Hive.openBox<Person>('local');
      },
      builder: EasyLoading.init(),
    ),
  );
}
