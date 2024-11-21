import 'package:flutter/material.dart';
import 'package:trip_flutter/pages/home_page.dart';
import 'package:trip_flutter/pages/login_page.dart';

class NavigatorUtil {
  // 用于在获取不到 context（上下文） 的地方，如dao中跳转页面时使用，需要在 HomePage 赋值
  static BuildContext? _context;
  static updateContext(BuildContext context) {
    NavigatorUtil._context = context;
    print('init: $context');
  }
  // 跳转到指定页面
  static push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
  // 跳转到首页
  static goToHome(BuildContext context) {
    // 跳转到主页并且不让返回
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
  // 跳转到登录页
  static goToLogin() {
    // 跳转到主页并且不让返回
    Navigator.pushReplacement(_context!, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}