import 'package:flutter/material.dart';

import '../dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;

  const AppIcon({
    Key? key,
    required this.icon,
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.iconColor = const Color(0xFF756d54),
    this.size = 0,
    this.iconSize = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size == 0 ? Dimensions.height60 : size,
        height: size == 0 ? Dimensions.height60 : size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                size == 0 ? Dimensions.height60 : size / 2),
            color: backgroundColor),
        child: Icon(
          icon,
          size: iconSize == 0 ? Dimensions.icon20 : iconSize,
          color: iconColor,
        ));
  }
}
