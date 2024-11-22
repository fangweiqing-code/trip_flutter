import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:trip_flutter/pages/screen_fix_page.dart';
import 'package:trip_flutter/util/screen_adapter_helper.dart';

// 封装轮播图组件

class BannerWidget extends StatefulWidget {
  final List<String> bannerList;
  const BannerWidget({super.key, required this.bannerList});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final CarouselSliderController _controller = CarouselSliderController();
  // List<String> get bannerList => widget.bannerList;
  late List<String> bannerList = widget.bannerList;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CarouselSlider(
          items: bannerList.map((item) => _tabImage(item, width)).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            height: 160.px,
            autoPlay: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              // 轮播图切换事件
            }
          ),
        )
      ],
    );
  }
  
  Widget _tabImage(String imageUrl, double width) {
    return GestureDetector(
      onTap: () {
        // TODO: NavigatorUtil.跳转H5
      },
      child: Image.network(imageUrl, width: width, fit: BoxFit.cover)
    );
  }
}
