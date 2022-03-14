import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/cart_controller.dart';
import 'package:untitled/controller/popular_product_controller.dart';
import 'package:untitled/route/route_help.dart';
import 'package:untitled/utils/app_constants.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/dimensions.dart';
import 'package:untitled/utils/widgets/appIcon.dart';
import 'package:untitled/utils/widgets/app_column.dart';
import 'package:untitled/utils/widgets/big_text.dart';
import 'package:untitled/utils/widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PopularProductController popularProductcontroller =
        Get.find<PopularProductController>();
    CartController cartcontroller = Get.find<CartController>();
    var product = popularProductcontroller.popularProductList[pageId];
    popularProductcontroller.initProduct(product, cartcontroller);

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
                        image: NetworkImage(AppConstants.BASE_URL +
                            AppConstants.UPLOAD_URL +
                            product.img!))),
              )),
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height45,
            child: Row(
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
                    icon: Icons.arrow_back_ios,
                  ),
                ),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return GestureDetector(
                    onTap: () {
                      if (controller.totalItems > 1) {
                        print("${controller.totalItems.toString()} items");
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
                        text: product.name!,
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
                          child:
                              ExpandableTextWidget(text: product.description!),
                        ),
                      )
                    ]),
              ))
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
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
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(Icons.remove,
                          color: AppColors.signColor, size: Dimensions.icon26),
                    ),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                    BigText(
                      text: popularProduct.inCartItem.toString(),
                      size: Dimensions.font26,
                    ),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(true);
                      },
                      child: Icon(
                        Icons.add,
                        color: AppColors.signColor,
                        size: Dimensions.icon26,
                      ),
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
                  child: GestureDetector(
                    onTap: () {
                      popularProduct.addItem(product);
                    },
                    child: BigText(
                        text: "\$ ${product.price!} add to cart",
                        color: Colors.white,
                        size: Dimensions.font26),
                  ))
            ],
          ),
        );
      }),
    );
  }
}
