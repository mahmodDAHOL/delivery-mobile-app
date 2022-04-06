import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/popular_product_controller.dart';
import 'package:untitled/pages/auth/sign_in_page.dart';
import 'package:untitled/pages/auth/sign_up_page.dart';
import 'package:untitled/pages/home/main_food_page.dart';
import 'package:untitled/pages/splash_page.dart';
import 'package:untitled/route/route_help.dart';

import 'controller/cart_controller.dart';
import 'controller/recommended_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();

    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "flutter Demo",

          home: SignUpPage(),
          // home: SplashScreen(),
          // initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
