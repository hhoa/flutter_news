import 'package:flutter/material.dart';
import 'package:flutter_news/theme/colors.dart';
import 'package:flutter_news/theme/fonts.dart';

class CommonTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Tab> tabs;

  CommonTabBar({required this.tabController, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: tabs,
      isScrollable: false,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 2,
      labelColor: Colors.black,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 0),
      labelPadding: EdgeInsets.symmetric(horizontal: 6),
      labelStyle: AssetFonts.bold(),
      unselectedLabelStyle: AssetFonts.regular(
          fontSize: 18, color: AssetColors.colorBlack333333),
    );
  }
}
