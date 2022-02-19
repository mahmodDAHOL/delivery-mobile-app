import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/widgets/big_text.dart';
import 'package:untitled/utils/widgets/small_text.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 45, bottom: 15),
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: "Syria",
                      color: AppColors.mainColor,
                    ),
                    Row(children: [
                      SmallText(
                        text: "Lattakia",
                        color: Colors.black54,
                      ),
                      Icon(Icons.arrow_drop_down_rounded)
                    ]),
                  ],
                ),
                Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        FoodPageBody()
      ]),
    );
  }
}
