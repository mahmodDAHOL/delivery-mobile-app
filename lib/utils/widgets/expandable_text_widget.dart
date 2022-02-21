import 'package:flutter/material.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/widgets/small_text.dart';

import '../colors.dart';
import '../dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  String textArrow = "show more";
  double textHeight = Dimensions.textHeight;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              height: 1.8,
              color: AppColors.paraColor,
              size: Dimensions.font15,
              text: firstHalf)
          : Column(
              children: [
                SmallText(
                    height: 1.8,
                    color: AppColors.paraColor,
                    size: Dimensions.font15,
                    text: hiddenText
                        ? firstHalf + "..."
                        : firstHalf + secondHalf),
                Container(
                  child: (widget.text.length > textHeight)
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              hiddenText = !hiddenText;
                              textArrow =
                                  hiddenText ? "show more" : "show less";
                            });
                          },
                          child: Row(
                            children: [
                              SmallText(
                                text: textArrow,
                                color: AppColors.mainColor,
                              ),
                              Icon(
                                hiddenText
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up,
                                color: AppColors.mainColor,
                              )
                            ],
                          ),
                        )
                      : Container(),
                )
              ],
            ),
    );
  }
}
