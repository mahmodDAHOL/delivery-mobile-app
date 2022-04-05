import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/dimensions.dart';
import 'package:untitled/utils/widgets/big_text.dart';
import 'package:untitled/utils/widgets/small_text.dart';

import '../../controller/popular_product_controller.dart';
import '../../controller/recommended_controller.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(
                top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Syria Country",
                        color: AppColors.mainColor,
                      ),
                      Row(children: [
                        SmallText(
                          text: "Lattakia",
                          color: Colors.black54,
                        ),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          size: Dimensions.icon24,
                        )
                      ]),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.width45,
                      height: Dimensions.height45,
                      child: Icon(
                        Icons.search,
                        size: Dimensions.icon24,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(child: FoodPageBody()))
        ]),
        onRefresh: _loadResources);
  }
}
