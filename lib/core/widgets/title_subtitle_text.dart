import 'dart:ui';

import 'package:flutter/material.dart';

class TitleSubtitleText extends StatelessWidget {
  const TitleSubtitleText({
    super.key,
    required this.title,
    required this.subtitle,
    this.isWhite = false,
    this.subFontSize = 12,
    this.subFontWeight = FontWeight.w400,
    this.subFontColor = const Color(0xFF878787),
  });

  final String title;
  final String subtitle;
  final bool isWhite;
  final double subFontSize;
  final FontWeight subFontWeight;
  final Color subFontColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: isWhite ? Colors.white : Colors.black.withOpacity(0.65),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          overflow: TextOverflow.ellipsis,
          style:  TextStyle(
            color: subFontColor,
            fontSize: subFontSize,
            fontWeight: subFontWeight,
          ),
        ),
      ],
    );
  }
}
