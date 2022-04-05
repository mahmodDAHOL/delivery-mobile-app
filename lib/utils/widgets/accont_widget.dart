import 'package:flutter/material.dart';
import 'package:untitled/utils/dimensions.dart';
import 'package:untitled/utils/widgets/big_text.dart';

import 'appIcon.dart';

class AccountWidget extends StatelessWidget {
  final AppIcon appIcon;
  final BigText bigText;
  const AccountWidget({Key? key, required this.appIcon, required this.bigText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimensions.width20,
          top: Dimensions.height10,
          bottom: Dimensions.height10),
      child: Row(
        children: [
          appIcon,
          SizedBox(
            width: Dimensions.width20,
          ),
          bigText
        ],
      ),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 2,
            offset: Offset(0, 5),
            color: Colors.grey.withOpacity(0.2))
      ]),
    );
  }
}
