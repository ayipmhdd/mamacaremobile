import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextType type;
  final Color? color;
  final TextAlign? textAlign;
  final double? height;

  const CustomText(
    this.text, {
    super.key,
    this.type = TextType.p,
    this.color,
    this.textAlign = TextAlign.start,
    this.height,
  });

  TextStyle _getStyle() {
    final defaultColor = color ?? const Color(0xFFFF3EA5);
    switch (type) {
      case TextType.h1:
        return TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
            color: defaultColor,
            height: height);
      case TextType.h2:
        return TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
            color: defaultColor,
            height: height);
      case TextType.h3:
        return TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
            color: defaultColor,
            height: height);
      case TextType.h4:
        return TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Quicksand',
            color: defaultColor,
            height: height);
      case TextType.h5:
        return TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Quicksand',
            color: defaultColor,
            height: height);
      case TextType.h6:
        return TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Quicksand',
            color: defaultColor,
            height: height);
      case TextType.p:
        return TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontFamily: 'Quicksand',
            color: defaultColor,
            height: height);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: _getStyle(),
    );
  }
}

enum TextType { h1, h2, h3, h4, h5, h6, p }