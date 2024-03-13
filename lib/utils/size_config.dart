import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth = 0;
  static double? screenHeight = 0;
  static double? defaultSize = 0;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    screenHeight = _mediaQueryData?.size.height;
    orientation = _mediaQueryData?.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight!;
  double screenWidth = SizeConfig.screenWidth!;
  if (screenHeight > screenWidth) {
    return (inputHeight / 756.0) * screenHeight;
  } else {
    return (inputHeight / 756.0) * screenWidth;
  }
  // 756 is the layout height that designer use
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenHeight = SizeConfig.screenHeight!;
  double screenWidth = SizeConfig.screenWidth!;
  if (screenHeight > screenWidth) {
    return (inputWidth / 360.0) * screenWidth;
  } else {
    return (inputWidth / 360.0) * screenHeight;
  }
  // 360 is the layout width that designer use
}
