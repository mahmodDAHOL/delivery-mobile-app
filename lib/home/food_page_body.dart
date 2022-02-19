import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/dimensions.dart';
import 'package:untitled/utils/widgets/big_text.dart';
import 'package:untitled/utils/widgets/icon_and_text.dart';
import 'package:untitled/utils/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.8);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainere;
  int _itemCount = 5;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Slider Section
      Container(
        height: Dimensions.pageView,
        child: PageView.builder(
            controller: pageController,
            itemCount: _itemCount,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            }),
      ),
      // Dots
      DotsIndicator(
        dotsCount: _itemCount,
        position: _currPageValue,
        decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: Size.square(Dimensions.height9),
            activeSize: Size(Dimensions.width18, Dimensions.height9),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius5))),
      ),
      SizedBox(
        height: Dimensions.height30,
      ),
      //Populer Text
      Container(
        margin: EdgeInsets.only(left: Dimensions.width30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BigText(text: "Popular"),
            SizedBox(width: Dimensions.width10),
            Container(
              margin: EdgeInsets.only(bottom: Dimensions.height3),
              child: BigText(
                text: ".",
                color: Colors.black26,
              ),
            ),
            SizedBox(width: Dimensions.width10),
            Container(
              margin: EdgeInsets.only(bottom: Dimensions.height2),
              child: SmallText(
                text: "food pairing",
                color: Colors.black26,
              ),
            ),
          ],
        ),
      ),
      // list of food and images
      ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: Dimensions.height10,
              ),
              child: Row(
                children: [
                  // image section
                  Container(
                    width: Dimensions.width120,
                    height: Dimensions.height120,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/burger2.png"))),
                  ),
                  // text Container
                  Expanded(
                    child: Container(
                      height: Dimensions.height100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight:
                                  Radius.circular(Dimensions.radius20)),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(
                                text:
                                    "maakarona with bashamail maakarona with bashamail"),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            SmallText(text: "it is very delicious"),
                            SizedBox(
                              height: Dimensions.height10,
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
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    ]);
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: Dimensions.pageViewContainere,
          margin: EdgeInsets.only(
              left: Dimensions.width10, right: Dimensions.width10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven ? Color(0xFFF16D38) : Color(0xFFA2EC18),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/burger2.png"))),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: Dimensions.height30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF000000),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                ]),
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width15,
                  top: Dimensions.height15,
                  right: Dimensions.width15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Chinese Side"),
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
                                  size: Dimensions.icon12,
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
            ),
          ),
        ),
      ]),
    );
  }
}
