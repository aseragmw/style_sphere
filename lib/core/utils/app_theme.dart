import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:style_sphere/core/extentions/screen_size.dart';

class AppTheme {
  //Colors
  static const Color primaryBlueColor = Color(0xff377DFF);
    static const Color whiteColor = Color(0xffffffff);

  static const Color primaryColor = Color(0xFF3686FF);
  static const Color blackColor = Color(0xff243443);
  static const Color lightBlackColor = Color(0xff2E3032);
  static const Color greyOneColor = Color(0xffF2F4F6);
  static const Color greyTwoColor = Color(0xffAAB0B7);
  static const Color fillColor = Color(0xffF9F9F9);
  static const Color redColor = Color(0xffE0144C);
  static const Color greenColor = Color(0xff50CD89);
  static const Color greyHintColor = Color(0xFFB4B3B3);


  //Font Sizes
  static double fontSize12(BuildContext context) => 12 * context.screenAspectRatio * 0.5;

  static double fontSize14(BuildContext context) => 14 * context.screenAspectRatio * 0.5;

  static double fontSize16(BuildContext context) => 16 * context.screenAspectRatio * 0.5;

  static double fontSize18(BuildContext context) => 18 * context.screenAspectRatio * 0.5;

  static double fontSize40(BuildContext context) => 40 * context.screenAspectRatio * 0.5;

  static double fontSize60(BuildContext context) => 60 * context.screenAspectRatio * 0.5;

  static double fontSize80(BuildContext context) => 80 * context.screenAspectRatio * 0.5;

  //Font Weights
  static const FontWeight fontWeight400 = FontWeight.w400;
  static const FontWeight fontWeight500 = FontWeight.w500;
  static const FontWeight fontWeight600 = FontWeight.w600;
  static const FontWeight fontWeight700 = FontWeight.w700;

  //Others
  static const BorderRadius boxRadius = BorderRadius.all(Radius.circular(12));
}
