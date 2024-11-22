import 'package:flutter/material.dart';
import 'package:trip_flutter/dao/login_dao.dart';
import 'package:trip_flutter/util/navigator_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  get _logoutBtn => TextButton(onPressed: () {
    LoginDao.logOut();
  }, child: const Text('登出', style: TextStyle(color: Colors.white),));

  @override
  Widget build(BuildContext context) {
    debugPrint('111');
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('首页', style: TextStyle(color: Colors.white)),
        actions: [_logoutBtn]
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true; // 切换tab时保持状态，页面不会销毁
}
