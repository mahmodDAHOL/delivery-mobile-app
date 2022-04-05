import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utils/widgets/app_text_field.dart';
import 'package:untitled/utils/widgets/big_text.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    List singUpImages = ["f.png", "g.png", "t.png"];
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Dimensions.screenHeight * 0.05),
              Container(
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: Dimensions.radius20 * 4,
                    backgroundImage: AssetImage("assets/images/logo.png"),
                  ),
                ),
              ),
              AppTextField(
                  textController: emailController,
                  hintText: "email",
                  icon: Icons.email),
              SizedBox(
                height: Dimensions.height20,
              ),
              AppTextField(
                  textController: passController,
                  hintText: "Password",
                  icon: Icons.password_sharp),
              SizedBox(
                height: Dimensions.height20,
              ),
              AppTextField(
                  textController: nameController,
                  hintText: "Name",
                  icon: Icons.person),
              SizedBox(
                height: Dimensions.height20,
              ),
              AppTextField(
                  textController: phoneController,
                  hintText: "Phone",
                  icon: Icons.phone),
              SizedBox(
                height: Dimensions.height20,
              ),
              Container(
                  width: Dimensions.screenWidth / 3,
                  height: Dimensions.screenHeight / 17,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColors.mainColor),
                  child: Center(
                      child: BigText(
                          text: "Sign up",
                          size: Dimensions.font26,
                          color: Colors.white))),
              SizedBox(
                height: Dimensions.height10,
              ),
              RichText(
                  text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                style: TextStyle(
                    color: Colors.grey[500], fontSize: Dimensions.font20),
                text: "Have an account already?",
              )),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              // Sign up options
              RichText(
                  text: TextSpan(
                style: TextStyle(
                    color: Colors.grey[500], fontSize: Dimensions.font20),
                text: "Sign up using one of the following methods",
              )),
              SizedBox(
                height: Dimensions.screenHeight * 0.03,
              ),
              Wrap(
                direction: Axis.horizontal,
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: Dimensions.radius20 * 2,
                            backgroundImage: AssetImage(
                                "assets/images/" + singUpImages[index]),
                          ),
                        )),
              )
            ],
          ),
        ));
  }
}
