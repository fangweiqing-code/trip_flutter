
import 'package:flutter/material.dart';

// 扩展int以方便使用
extension IntFix on int {
  // eg: 200.px
  double get px {
    return ScreenHelper.getPx(toDouble());
  }
}

// 扩展double以方便使用
extension DoubleFix on double {
  // eg: 200.0.px
  double get px {
    return ScreenHelper.getPx(this);
  }
}

// 屏幕适配工具类
class ScreenHelper {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double ratio;

  // 根据设计稿实际宽度初始化
  // baseWidth为设计稿宽度
  static init(BuildContext context, {double baseWidth = 375}) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    ratio = screenWidth / baseWidth; //屏幕宽度和设计稿宽度的比值
  }

  // 获取设计稿对应的大小
  static double getPx(double size) {
    return ScreenHelper.ratio * size;
  }
}

