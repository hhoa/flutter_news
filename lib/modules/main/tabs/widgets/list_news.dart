import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/common/widgets/common_shimmer.dart';
import 'package:flutter_news/common/widgets/widgets.dart';
import 'package:flutter_news/model/news_model.dart';
import 'package:flutter_news/modules/main/tabs/widgets/controller.dart';
import 'package:flutter_news/theme/fonts.dart';
import 'package:flutter_news/theme/images.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class ListNews extends GetView {
  late final ControllerListNews controller;

  ListNews({Key? key, required String path, required String keyText, String? query}) : super(key: key) {
    controller = Get.put(ControllerListNews(path, query), tag: keyText);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: () async {
          await controller.setupData();
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification &&
                notification.metrics.axis == Axis.vertical) {
              double currentPixel = notification.metrics.pixels;
              double maxScrollExtent = notification.metrics.maxScrollExtent;

              if (currentPixel > (maxScrollExtent - 200)) {
                controller.loadData();
              }
            }
            return false;
          },
          child: ListView.separated(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.only(top: 32,
                left: 16, right: 16, bottom: Get.bottomBarHeight + 16),
            itemBuilder: (context, index) {
              if (controller.listNewsModelValue == null) {
                return _buildShimmerItem();
              }
              List<NewsModel> list = controller.listNewsModelValue!.articles;
              if (index >= list.length) {
                return _buildShimmerItem();
              }

              return _buildItem(list[index]);
            },
            separatorBuilder: (_, __) => buildHeight(32),
            itemCount: controller.getItemCount,
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
          child: CommonShimmer(
            child: Container(
              width: double.maxFinite,
              height: 200,
            ),
          ),
        ),
        buildHeight(16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CommonShimmer(
                    child: Container(
                      width: 100,
                      height: 20,
                    ),
                  ),
                  buildWidth(12),
                  CommonShimmer(
                    child: Container(
                      width: 100,
                      height: 20,
                    ),
                  ),
                ],
              ),
              buildHeight(16),
              CommonShimmer(
                child: Container(
                  width: double.maxFinite,
                  height: 26,
                ),
              ),
              buildHeight(4),
              CommonShimmer(
                child: Container(
                  width: Get.width / 2,
                  height: 26,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildItem(NewsModel model) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2)
        ),
        child: Column(
          children: [
            _buildImage(model.urlToImage),
            buildHeight(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSource(model.source.name, model.publishedAt),
                  buildHeight(16),
                  Text(
                    model.title,
                    style: AssetFonts.bold(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String? url) {
    Widget placeholder() {
      return Image.asset(
        AssetImages.imgPlaceholder,
        height: 200,
        fit: BoxFit.cover,
      );
    }
    return CachedNetworkImage(
      imageUrl: url ?? "",
      errorWidget: (_, __, ___) => placeholder(),
      placeholder: (_, __) => placeholder(),
      width: double.maxFinite,
      height: 200,
      fit: BoxFit.cover,
    );
  }

  Widget _buildSource(String source, DateTime dateTime) {
    return Row(
      children: [
        Text(
          source,
          style: AssetFonts.regular(fontSize: 12),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Icon(
            Icons.circle,
            size: 4,
            color: Colors.black,
          ),
        ),
        Text(
          timeago.format(dateTime),
          style: AssetFonts.regular(fontSize: 12),
        ),
      ],
    );
  }
}
