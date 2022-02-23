import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/popular_product_controller.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/dimensions.dart';
import 'package:untitled/utils/widgets/appIcon.dart';
import 'package:untitled/utils/widgets/app_column.dart';
import 'package:untitled/utils/widgets/big_text.dart';
import 'package:untitled/utils/widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().getPopularProductList;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/burger.png"))),
              )),
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.popularFoodImgSize - Dimensions.height20,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.height20,
                    top: Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20)),
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        text: "Chinese food",
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText(text: "Introduce"),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              text:
                                  "kgflkbelkjvbejkllkjebvkevkebnvlkenjnkbjddsndnklckdkgflkbelkjvbejkllkjebvkevkebnvlkenjnkbjddsndnklckdkgflkbelkjvbejkllkjebvkevkebnvlkenjnkbjddsndnklckdkgflkbelkjvbejkllkjebvkevkebnvlkenjnkbjddsndnklckdkgflkbelkjvbejkllkjebvkevkebnvlkenjnkbjddsndnklckdkgflkbelkjvbejkllkjebvkevkebnvlkenjnkbjddsndnklckdkgflkbelkjvbejkllkjebvkevkebnvlkenjnkbjddsndnklckdkgflkbelkjvbejkllkjebvkevkebnvlkenjnkbjddsndnklckdkgflkbelkjvbejkllkjebvkevkebnvlkenjnkbjddsndnklckdkgflkbelkjvbejkllkjebvkevkebnvlkenjnkbjddsndnklckd"),
                        ),
                      )
                    ]),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height30,
            bottom: Dimensions.height30),
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: Dimensions.height60,
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height10,
                  horizontal: Dimensions.width10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20)),
              child: Row(
                children: [
                  Icon(Icons.remove,
                      color: AppColors.signColor, size: Dimensions.icon26),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  BigText(
                    text: "0",
                    size: Dimensions.font26,
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                    size: Dimensions.icon26,
                  ),
                ],
              ),
            ),
            Container(
                height: Dimensions.height60,
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height10,
                    horizontal: Dimensions.width10),
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                child: BigText(
                    text: "\$10 add to cart",
                    color: Colors.white,
                    size: Dimensions.font26))
          ],
        ),
      ),
    );
  }
}
