import 'package:flutter/material.dart';

// 登录输入框，自定义Widget

class InputWidget extends StatelessWidget {
  final String hint; // 提示文字
  final ValueChanged<String>? onChanged; // 输入框内容变化的回调
  final bool obscureText; // 是否以密码的方式来显示
  final TextInputType? keyboardType; // 键盘输入类型

  const InputWidget(this.hint,
      {super.key, this.onChanged, this.obscureText = false, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _input(),
        const Divider(height: 1, color: Colors.white, thickness: 0.5)
      ],
    );
  }

  _input() {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      autofocus: !obscureText, // 密码输入框不自动聚焦
      cursorColor: Colors.white,
      style:
          // 输入框文字样式
          const TextStyle(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.w400),
      // 输入框样式
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 17, color: Colors.grey)),
    );
  }
}
