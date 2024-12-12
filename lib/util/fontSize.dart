import 'package:flutter/material.dart';
//반응형 폰트 -- 플립, 폴드의 경우 제거
class DynamicFontSize {
  //적용법 fontSize: FontSize.font20(context),
  static double font35(BuildContext context) {
    return _getFontSize(context, 0.075, 35);
  }

  static double font30(BuildContext context) {
    return _getFontSize(context, 0.065, 30);
  }

  static double font25(BuildContext context) {
    return _getFontSize(context, 0.055, 25);
  }

  static double font24(BuildContext context) {
    return _getFontSize(context, 0.053, 24);
  }

  static double font23(BuildContext context) {
    return _getFontSize(context, 0.051, 23);
  }

  static double font22(BuildContext context) {
    return _getFontSize(context, 0.049, 22);
  }

  static double font21(BuildContext context) {
    return _getFontSize(context, 0.047, 21);
  }

  static double font20(BuildContext context) {
    return _getFontSize(context, 0.045, 20);
  }

  static double font19(BuildContext context) {
    return _getFontSize(context, 0.043, 19);
  }

  static double font18(BuildContext context) {
    return _getFontSize(context, 0.041, 18);
  }

  static double font17(BuildContext context) {
    return _getFontSize(context, 0.039, 17);
  }

  static double font16(BuildContext context) {
    return _getFontSize(context, 0.037, 16);
  }

  static double font15(BuildContext context) {
    return _getFontSize(context, 0.035, 15);
  }

  static double font14(BuildContext context) {
    return _getFontSize(context, 0.033, 14);
  }

  static double font13(BuildContext context) {
    return _getFontSize(context, 0.031, 13);
  }

  static double font12(BuildContext context) {
    return _getFontSize(context, 0.029, 12);
  }

  static double font11(BuildContext context) {
    return _getFontSize(context, 0.027, 11);
  }

  static double font10(BuildContext context) {
    return _getFontSize(context, 0.025, 10);
  }

  static double _getFontSize(BuildContext context, double ratio, double fixedSize) {
    double screenWidth = MediaQuery.of(context).size.width;

    // 예를 들어, 화면 넓이가 400dp 이하인 경우 고정된 값을 반환
    if (screenWidth >= 460) {
      return fixedSize;
    }

    // 그 외의 경우 비율에 따라 계산된 값을 반환
    return screenWidth * ratio;
  }
}