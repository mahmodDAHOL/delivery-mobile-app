import 'package:get/get.dart';
import 'package:untitled/controller/cart_controller.dart';
import 'package:untitled/controller/popular_product_controller.dart';
import 'package:untitled/controller/recommended_controller.dart';
import 'package:untitled/data/api/api_client.dart';
import 'package:untitled/data/api/repository/cart_repo.dart';
import 'package:untitled/data/api/repository/recommended_product_repo.dart';
import 'package:untitled/data/api/repository/popular_product_repo.dart';
import 'package:untitled/utils/app_constants.dart';

// note: Get.find() is called that immediately initialize the instances that are on memory.
Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
