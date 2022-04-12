import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:untitled/base/no_data_page.dart';
import 'package:untitled/controller/auth_controller.dart';
import 'package:untitled/controller/cart_controller.dart';
import 'package:untitled/controller/popular_product_controller.dart';
import 'package:untitled/controller/recommended_controller.dart';
import 'package:untitled/route/route_help.dart';
import 'package:untitled/utils/app_constants.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/dimensions.dart';
import 'package:untitled/utils/widgets/appIcon.dart';
import 'package:untitled/utils/widgets/big_text.dart';
import 'package:untitled/utils/widgets/small_text.dart';

import '../../controller/location_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: Dimensions.height60,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.initial);
                      },
                      child: AppIcon(
                        icon: Icons.arrow_back_ios,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        iconSize: Dimensions.icon24,
                        size: Dimensions.height45,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width120,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.initial);
                      },
                      child: AppIcon(
                        icon: Icons.home_outlined,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        iconSize: Dimensions.icon24,
                        size: Dimensions.height45,
                      ),
                    ),
                    AppIcon(
                      icon: Icons.shopping_cart,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.icon24,
                      size: Dimensions.height45,
                    ),
                  ],
                )),
            GetBuilder<CartController>(builder: (cartController) {
              return cartController.getItems.length > 0
                  ? Positioned(
                      top: Dimensions.height120,
                      right: Dimensions.width20,
                      left: Dimensions.width20,
                      bottom: 0,
                      child: Container(
                        margin: EdgeInsets.only(top: Dimensions.height15),
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GetBuilder<CartController>(
                            builder: (cartController) {
                              var _cartList = cartController.getItems;
                              return ListView.builder(
                                  itemCount: _cartList.length,
                                  itemBuilder: (_, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        var productIndex =
                                            Get.find<PopularProductController>()
                                                .popularProductList
                                                .indexOf(
                                                    _cartList[index].product!);
                                        if (productIndex >= 0) {
                                          Get.toNamed(
                                              RouteHelper.getPopularFood(
                                                  productIndex, "cartpage"));
                                        } else {
                                          var recommendedIndex = Get.find<
                                                  RecommendedProductController>()
                                              .recommendedProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                          if (recommendedIndex < 0) {
                                            Get.snackbar("History product",
                                                "product review is not available",
                                                backgroundColor:
                                                    AppColors.mainColor,
                                                colorText: Colors.white);
                                          } else {
                                            Get.toNamed(
                                                RouteHelper.getRecommendedFood(
                                                    recommendedIndex,
                                                    "cartpage"));
                                          }
                                        }
                                      },
                                      child: Container(
                                        width: double.maxFinite,
                                        height: Dimensions.height120,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: Dimensions.width120,
                                              height: Dimensions.height120,
                                              margin: EdgeInsets.only(
                                                  bottom: Dimensions.height10),
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          AppConstants
                                                                  .BASE_URL +
                                                              AppConstants
                                                                  .UPLOAD_URL +
                                                              cartController
                                                                  .getItems[
                                                                      index]
                                                                  .img
                                                                  .toString())),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius20)),
                                            ),
                                            SizedBox(
                                              width: Dimensions.width10,
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: Dimensions.height120,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    BigText(
                                                      text: cartController
                                                          .getItems[index].name
                                                          .toString(),
                                                      color: Colors.black54,
                                                    ),
                                                    SmallText(text: "lkjjhuj"),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        BigText(
                                                          text: cartController
                                                              .getItems[index]
                                                              .price
                                                              .toString(),
                                                          color:
                                                              Colors.redAccent,
                                                        ),
                                                        Container(
                                                          height: Dimensions
                                                              .height45,
                                                          width: Dimensions
                                                              .width100,
                                                          padding: EdgeInsets.symmetric(
                                                              vertical:
                                                                  Dimensions
                                                                      .height10,
                                                              horizontal:
                                                                  Dimensions
                                                                      .width10),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      Dimensions
                                                                          .radius20)),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  cartController.addItem(
                                                                      _cartList[
                                                                              index]
                                                                          .product!,
                                                                      -1);
                                                                },
                                                                child: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color: AppColors
                                                                        .signColor,
                                                                    size: Dimensions
                                                                        .icon30),
                                                              ),
                                                              SizedBox(
                                                                width: Dimensions
                                                                        .width10 /
                                                                    2,
                                                              ),
                                                              BigText(
                                                                text: _cartList[
                                                                        index]
                                                                    .quantity
                                                                    .toString(),
                                                              ),
                                                              SizedBox(
                                                                width: Dimensions
                                                                        .width10 /
                                                                    2,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  cartController.addItem(
                                                                      _cartList[
                                                                              index]
                                                                          .product!,
                                                                      1);
                                                                },
                                                                child: Icon(
                                                                  Icons.add,
                                                                  color: AppColors
                                                                      .signColor,
                                                                  size: Dimensions
                                                                      .icon30,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      ))
                  : NoDataPage(text: "Your cart is empty");
            })
          ],
        ),
        bottomNavigationBar:
            GetBuilder<CartController>(builder: (cartController) {
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
              child: cartController.getItems.length > 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: Dimensions.height60,
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height10,
                              horizontal: Dimensions.width10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Dimensions.width10 / 2,
                              ),
                              BigText(
                                text: "\$ " +
                                    cartController.totalAmount.toString(),
                                size: Dimensions.font26,
                              ),
                              SizedBox(
                                width: Dimensions.width10 / 2,
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
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20)),
                            child: GestureDetector(
                              onTap: () {
                                if (Get.find<AuthController>().userLoggedIn()) {
                                  if (Get.find<LocationController>()
                                      .addressList
                                      .isEmpty) {
                                    Get.toNamed(RouteHelper.addAddress);
                                  }
                                  // cartController.addToHistory();
                                } else {
                                  Get.toNamed(RouteHelper.getSignInPage());
                                }
                                ;
                              },
                              child: BigText(
                                  text: "Check out",
                                  color: Colors.white,
                                  size: Dimensions.font26),
                            ))
                      ],
                    )
                  : Container());
        }));
  }
}
