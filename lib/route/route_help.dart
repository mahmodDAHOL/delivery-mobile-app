import 'package:get/get.dart';
import 'package:untitled/pages/food/popular_food_datail.dart';
import 'package:untitled/pages/food/recommended_food_detail.dart';
import 'package:untitled/pages/home/main_food_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial() => "$initial ";
  static String getPopularFood(int pageId) => "$popularFood?pageId=$pageId";
  static String getRecommendedFood() => "$recommendedFood";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          int pageId = Get.parameters['pageId'] as int;
          return PopularFoodDetail(
            pageId: pageId,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () => RecommendedFoodDetail(),
        transition: Transition.fadeIn),
  ];
}
