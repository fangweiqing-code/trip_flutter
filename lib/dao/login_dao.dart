// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_hi_cache/flutter_hi_cache.dart';
import 'package:http/http.dart' as http;
import 'package:trip_flutter/dao/header_util.dart';
import 'package:trip_flutter/util/navigator_util.dart';

// 登录接口
class LoginDao {
  static const boardingPass = "boarding_Pass";
  static login({ required String userName, required String password }) async {
    Map<String, String> paramsMap = {};
    paramsMap["userName"] = userName;
    paramsMap["password"] = password;
    var uri = Uri.https('api.devio.org', '/uapi/user/login', paramsMap);
    final response = await http.get(uri, headers: hiHeaders());
    Utf8Decoder utf8decoder = const Utf8Decoder(); // fix 中文乱码
    String bodyString = utf8decoder.convert(response.bodyBytes);
    print(bodyString);
    if (response.statusCode == 200) {
      var result = json.decode(bodyString);
      if (result['code'] == 0 && result['data']!= null) {
        // 保存登录令牌
        _saveBoardingPass(result['data']);
      } else {
        // 异常处理
        throw Exception(bodyString);
      }
    } else {
      throw Exception(bodyString);
    }
  }
  
  // 保存令牌 - 只有登录成功才会调用，设为私有方法
  static void _saveBoardingPass(String value) {
    HiCache.getInstance().setString(boardingPass, value);
  }
  // 获取令牌设置为非私有方法 - 其他地方也可调用
  static getBoardingPass() {
    HiCache.getInstance().get(boardingPass);
  }
  // 登出
  static void logOut() {
    // 移除登录保存的信息
    HiCache.getInstance().remove(boardingPass);
    NavigatorUtil.goToLogin();
  }
  
}
