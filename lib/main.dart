import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:untitled/controller/popular_product_controller.dart';
import 'package:untitled/pages/home/main_food_page.dart';

import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter Demo",
      home: MainFoodPage(),
    );
  }
}
