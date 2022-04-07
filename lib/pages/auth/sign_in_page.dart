import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/base/custom_loader.dart';
import 'package:untitled/pages/auth/sign_up_page.dart';
import 'package:untitled/utils/widgets/app_text_field.dart';
import 'package:untitled/utils/widgets/big_text.dart';

import '../../base/show_custom_snackbar.dart';
import '../../controller/auth_controller.dart';
import '../../route/route_help.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    void _login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("Type your email address", title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type a valid email address",
            title: "Valid email address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than six characters ",
            title: "Password");
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: Dimensions.screenHeight * 0.05),
                      // logo
                      Container(
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: Dimensions.radius20 * 4,
                            backgroundImage:
                                AssetImage("assets/images/logo.png"),
                          ),
                        ),
                      ),
                      // Welcome section
                      Container(
                          margin: EdgeInsets.only(left: Dimensions.width20),
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello",
                                style: TextStyle(
                                    fontSize: Dimensions.font26 * 3,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Sign in your account",
                                style: TextStyle(
                                    fontSize: Dimensions.font26,
                                    color: Colors.grey[500]),
                              )
                            ],
                          )),
                      SizedBox(
                        height: Dimensions.height20,
                      ),

                      AppTextField(
                          textController: emailController,
                          hintText: "Email",
                          icon: Icons.email),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      AppTextField(
                          isObscure: true,
                          textController: passwordController,
                          hintText: "Password",
                          icon: Icons.password_sharp),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(children: [
                        Expanded(child: Container()),
                        RichText(
                            text: TextSpan(
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font20),
                          text: "Sign into your account",
                        )),
                        SizedBox(
                          width: Dimensions.width20,
                        )
                      ]),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      // Sign in
                      GestureDetector(
                        onTap: () {
                          _login(authController);
                        },
                        child: Container(
                            width: Dimensions.screenWidth / 3,
                            height: Dimensions.screenHeight / 14,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius30),
                                color: AppColors.mainColor),
                            child: Center(
                                child: BigText(
                                    text: "Sign in",
                                    size: Dimensions.font26,
                                    color: Colors.white))),
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),

                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimensions.font20),
                              text: "Dont't have an account?",
                              children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => SignUpPage(),
                                    transition: Transition.leftToRight),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Dimensions.font20),
                              text: "Craete",
                            )
                          ])),
                    ],
                  ),
                )
              : CustomLoader();
        }));
  }
}
