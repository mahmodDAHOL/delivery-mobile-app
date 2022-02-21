import 'package:flutter/material.dart';
import 'package:untitled/utils/widgets/small_text.dart';

import '../colors.dart';
import '../dimensions.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: text,
            size: Dimensions.font26,
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Row(
            children: [
              Wrap(
                children: List.generate(
                    5,
                    (index) => Icon(
                          Icons.star,
                          color: AppColors.mainColor,
                          size: Dimensions.icon15,
                        )),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              SmallText(text: "4.5"),
              SizedBox(
                width: Dimensions.width10,
              ),
              SmallText(text: "1257"),
              SizedBox(
                width: Dimensions.width10,
              ),
              SmallText(text: "comments"),
            ],
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndTextWidget(
                  icon: Icons.circle_sharp,
                  iconColor: AppColors.iconColor,
                  text: "Normal"),
              IconAndTextWidget(
                  icon: Icons.location_on,
                  iconColor: AppColors.mainColor,
                  text: "1.7km"),
              IconAndTextWidget(
                  icon: Icons.access_time_rounded,
                  iconColor: AppColors.iconColor2,
                  text: "^32min"),
            ],
          )
        ],
      ),
    );
  }
}
