import 'package:flutter/material.dart';
import 'package:trip_flutter/dao/login_dao.dart';
import 'package:trip_flutter/util/navigator_util.dart';
import 'package:trip_flutter/widget/banner_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  static const appBarScrollOffset = 100; // appbar滑动距离阈值
  final List<String> bannerList = [
    "https://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg",
    "https://o.devio.org/images/fa/cat-4098058__340.webp",
    "https://o.devio.org/images/fa/photo-1601513041797-a79a526a521e.webp",
    "https://o.devio.org/images/other/as-cover.png",
    "https://o.devio.org/images/other/rn-cover2.png"
  ];

  double appBarAlpha = 0; // 顶部appbar透明度

  get _logoutBtn => ElevatedButton(
      onPressed: () {
        // LoginDao.logOut();
      },
      child: const Text(
        '登出',
        style: TextStyle(color: Colors.black),
      ));

  get _appBar => Opacity(
      opacity: appBarAlpha,
      child: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('首页'),
          ),
        ),
      ));

  get _listView => ListView(
        children: [
          BannerWidget(bannerList: bannerList),
          _logoutBtn,
          const SizedBox(
            height: 800,
            child: ListTile(
              title: Text('哈哈'),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Stack(
      children: [
        MediaQuery.removePadding(
            removeTop: true, // 移除顶部空白
            context: context,
            child: NotificationListener(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0) {
                    // 根节点的滚动
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                  return false;
                },
                child: _listView)),
        _appBar
      ],
    ));
  }

  @override
  // 切换tab时保持状态，页面不会销毁
  bool get wantKeepAlive => true;

  void _onScroll(double offset) {
    print('offset: $offset');
    double alpha = offset / appBarScrollOffset;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    print('alpha: $alpha');
    setState(() {
      appBarAlpha = alpha;
    });
  }
}
