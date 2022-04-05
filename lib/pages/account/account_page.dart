import 'package:flutter/material.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/widgets/appIcon.dart';
import 'package:untitled/utils/widgets/big_text.dart';

import '../../utils/dimensions.dart';
import '../../utils/widgets/accont_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Container(
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
                      bigText: BigText(text: "Ahmed"),
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
                      bigText: BigText(text: "0967565122"),
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
                      bigText: BigText(text: "mahmodaldahol4153@gmail.com"),
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
                      bigText: BigText(text: "Fill in your address"),
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
                      bigText: BigText(text: "Ahmed"),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
