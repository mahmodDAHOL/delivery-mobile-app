import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/controller/auth_controller.dart';
import 'package:untitled/controller/cart_controller.dart';
import 'package:untitled/controller/popular_product_controller.dart';
import 'package:untitled/controller/recommended_controller.dart';
import 'package:untitled/data/api/api_client.dart';
import 'package:untitled/data/api/repository/auth_repo.dart';
import 'package:untitled/data/api/repository/cart_repo.dart';
import 'package:untitled/data/api/repository/recommended_product_repo.dart';
import 'package:untitled/data/api/repository/popular_product_repo.dart';
import 'package:untitled/utils/app_constants.dart';

import '../controller/location_controller.dart';
import '../controller/user_controller.dart';
import '../data/api/repository/location_repo.dart';
import '../data/api/repository/user_repo.dart';

// note: Get.find() is called that immediately initialize the instances that are on memory.
Future<void> init() async {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences sharedPreferences = await _prefs;
  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(
      () => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
}
