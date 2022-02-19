import 'package:flutter/cupertino.dart';
import 'package:untitled/utils/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  const IconAndTextWidget(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: iconColor,
        ),
        SizedBox(
          width: 5,
        ),
        SmallText(text: text)
      ],
    );
  }
}
