import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/base/custom_loader.dart';
import 'package:untitled/controller/auth_controller.dart';
import 'package:untitled/controller/user_controller.dart';
import 'package:untitled/route/route_help.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/widgets/appIcon.dart';
import 'package:untitled/utils/widgets/big_text.dart';

import '../../controller/cart_controller.dart';
import '../../utils/dimensions.dart';
import '../../utils/widgets/accont_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Center(
          child: BigText(
            text: "Profile",
            size: Dimensions.font26,
            color: Colors.white,
          ),
        ),
      ),
      body: GetBuilder<UserController>(
        builder: (userController) {
          return _userLoggedIn
              ? (userController.isLoading
                  ? Container(
                      margin: EdgeInsets.only(top: Dimensions.height20),
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          // profile
                          AppIcon(
                            icon: Icons.person,
                            backgroundColor: AppColors.mainColor,
                            iconColor: Colors.white,
                            iconSize: Dimensions.icon26 * 3,
                            size: Dimensions.height15 * 10,
                          ),
                          SizedBox(
                            height: Dimensions.height30,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  // name
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.person,
                                      backgroundColor: AppColors.mainColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.icon30,
                                      size: Dimensions.height40,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.name),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  //phone
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.phone,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.icon30,
                                      size: Dimensions.height40,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.phone),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  //email
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.email,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.icon30,
                                      size: Dimensions.height40,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.email),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  //address
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.location_on,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.icon30,
                                      size: Dimensions.height40,
                                    ),
                                    bigText:
                                        BigText(text: "Fill in your address"),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  // message
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.message_outlined,
                                      backgroundColor: Colors.redAccent,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.icon30,
                                      size: Dimensions.height40,
                                    ),
                                    bigText: BigText(text: "messages"),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (Get.find<AuthController>()
                                          .userLoggedIn()) {
                                        Get.find<AuthController>()
                                            .clearSharedData();
                                        Get.find<CartController>().clear();
                                        Get.find<CartController>()
                                            .clearCartHistory();
                                        Get.toNamed(
                                            RouteHelper.getSignInPage());
                                      }
                                    },
                                    child: AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.logout,
                                        backgroundColor: Colors.redAccent,
                                        iconColor: Colors.white,
                                        iconSize: Dimensions.icon30,
                                        size: Dimensions.height40,
                                      ),
                                      bigText: BigText(text: "logout"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : CustomLoader())
              : Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: Dimensions.height100 * 4,
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/signin.png"))),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getSignInPage());
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: Dimensions.height80,
                            margin: EdgeInsets.only(
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                            ),
                            child: Center(
                                child: BigText(
                              text: "Sign in",
                              color: Colors.white,
                              size: Dimensions.font30,
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
