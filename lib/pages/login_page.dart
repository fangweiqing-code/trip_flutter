import 'package:flutter/material.dart';

// 登录页

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginEnable = false; // 登录按钮是否可用
  String? userName; // 用户名
  String? password; // 密码

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}