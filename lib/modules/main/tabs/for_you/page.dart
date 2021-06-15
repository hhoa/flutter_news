import 'package:flutter/material.dart';
import 'package:flutter_news/modules/main/tabs/widgets/list_news.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ForYouPage extends GetView {
  final ForYouController controller = Get.put(ForYouController());

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: const Text('Everything'),
                floating: true,
                snap: true,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  tabs: controller.tabs,
                  controller: controller.tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                ),
              ),
            )
          ];
        },
        body: _buildList());
  }

  Widget _buildList() {
    return TabBarView(
      controller: controller.tabController,
      children: controller.tabs
          .map((e) => ListNews(
                key: PageStorageKey("everything-${e.text}"),
                keyText: "everything-${e.text}",
                path: "everything",
                query: e.text,
              ))
          .toList(),
    );
  }
}
