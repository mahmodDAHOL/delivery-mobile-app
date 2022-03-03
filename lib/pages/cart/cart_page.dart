import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:untitled/controller/cart_controller.dart';
import 'package:untitled/route/route_help.dart';
import 'package:untitled/utils/app_constants.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/dimensions.dart';
import 'package:untitled/utils/widgets/appIcon.dart';
import 'package:untitled/utils/widgets/big_text.dart';
import 'package:untitled/utils/widgets/small_text.dart';

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
          Positioned(
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
                      return ListView.builder(
                          itemCount: cartController.getItems.length,
                          itemBuilder: (_, index) {
                            return Container(
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
                                                AppConstants.BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    cartController
                                                        .getItems[index].img
                                                        .toString())),
                                        borderRadius: BorderRadius.circular(
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
                                            MainAxisAlignment.spaceEvenly,
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(
                                                text: cartController
                                                    .getItems[index].price
                                                    .toString(),
                                                color: Colors.redAccent,
                                              ),
                                              Container(
                                                height: Dimensions.height45,
                                                width: Dimensions.width100,
                                                padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        Dimensions.height10,
                                                    horizontal:
                                                        Dimensions.width10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                .radius20)),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.remove,
                                                        color:
                                                            AppColors.signColor,
                                                        size:
                                                            Dimensions.icon26),
                                                    SizedBox(
                                                      width:
                                                          Dimensions.width10 /
                                                              2,
                                                    ),
                                                    BigText(
                                                      text: "jkkh",
                                                      size: Dimensions.font15,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          Dimensions.width10 /
                                                              2,
                                                    ),
                                                    Icon(
                                                      Icons.add,
                                                      color:
                                                          AppColors.signColor,
                                                      size: Dimensions.icon26,
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
                            );
                          });
                    },
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
