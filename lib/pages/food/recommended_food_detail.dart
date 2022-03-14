import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/cart_controller.dart';
import 'package:untitled/controller/popular_product_controller.dart';
import 'package:untitled/controller/recommended_controller.dart';
import 'package:untitled/route/route_help.dart';
import 'package:untitled/utils/app_constants.dart';
import 'package:untitled/utils/dimensions.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/widgets/appIcon.dart';
import 'package:untitled/utils/widgets/big_text.dart';
import 'package:untitled/utils/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetail(
      {Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: Dimensions.height100,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (page == "cartpage") {
                        Get.toNamed(RouteHelper.getCartPage());
                      } else {
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                    child: AppIcon(
                      icon: Icons.clear,
                    ),
                  ),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        if (controller.totalItems > 1) {
                          Get.toNamed(RouteHelper.getCartPage());
                        }
                      },
                      child: Stack(
                        children: [
                          AppIcon(
                            icon: Icons.shopping_cart_outlined,
                          ),
                          AppIcon(
                            icon: Icons.shopping_cart_outlined,
                          ),
                          controller.totalItems > 1
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: Dimensions.height25,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                )
                              : Container(),
                          controller.totalItems > 1
                              ? Positioned(
                                  right: 4,
                                  top: 2,
                                  child: BigText(
                                    text: "${controller.inCartItem}",
                                    size: Dimensions.height15,
                                    color: Colors.white,
                                  ))
                              : Container(),
                        ],
                      ),
                    );
                  })
                ],
              ),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: Dimensions.height400,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.height20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20))),
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  child: Center(
                    child:
                        BigText(size: Dimensions.font30, text: product.name!),
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                    AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        product.img!,
                    width: double.infinity,
                    fit: BoxFit.cover),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(children: [
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: ExpandableTextWidget(text: product.description!),
              ),
            ]))
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20 * 2.5,
                      right: Dimensions.width20 * 2.5,
                      top: Dimensions.height10,
                      bottom: Dimensions.height10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(false);
                        },
                        child: AppIcon(
                            iconSize: Dimensions.icon24,
                            iconColor: Colors.white,
                            backgroundColor: AppColors.mainColor,
                            icon: Icons.remove),
                      ),
                      BigText(
                          text:
                              "\$ ${product.price!} X ${controller.inCartItem}",
                          color: AppColors.mainBlackColor,
                          size: Dimensions.font26),
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(true);
                        },
                        child: AppIcon(
                            iconSize: Dimensions.icon24,
                            iconColor: Colors.white,
                            backgroundColor: AppColors.mainColor,
                            icon: Icons.add),
                      )
                    ],
                  ),
                ),
                Container(
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
                        // height: Dimensions.height60,
                        // width: Dimensions.width45,
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height20,
                            horizontal: Dimensions.width20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20)),
                        child: Icon(Icons.favorite,
                            color: AppColors.mainColor,
                            size: Dimensions.icon26),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addItem(product);
                        },
                        child: Container(
                            height: Dimensions.height60,
                            padding: EdgeInsets.symmetric(
                                vertical: Dimensions.height10,
                                horizontal: Dimensions.width10),
                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20)),
                            child: BigText(
                                text: "\$${product.price} add to cart",
                                color: Colors.white,
                                size: Dimensions.font26)),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
