import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/common/widgets/common_network_image.dart';
import 'package:flutter_news/common/widgets/widgets.dart';
import 'package:flutter_news/model/news_model.dart';
import 'package:flutter_news/modules/details/webview_page.dart';
import 'package:flutter_news/theme/fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_news/common/extension/extensions.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsModel model;
  final EdgeInsets paddingHorizontal = EdgeInsets.symmetric(horizontal: 24);

  NewsDetailPage(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.source.name),
        actions: [
          IconButton(onPressed: goToWebView, icon: Icon(Icons.ios_share)),
        ],
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return ListView(
      children: [
        buildHeight(16),
        _buildTitle(),
        buildHeight(16),
        _buildDescription(),
        buildHeight(24),
        CommonNetworkImage(model.urlToImage ?? ""),
        buildHeight(16),
        _buildDate(),
        buildHeight(8),
        _buildAuthor(),
        buildHeight(48),
        _buildNewsContent(),
      ],
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: paddingHorizontal,
      child: Text(
        model.title,
        style: AssetFonts.black(fontSize: 24),
      ),
    );
  }

  Widget _buildDescription() {
    if (model.description == null) return Container();
    return Padding(
      padding: paddingHorizontal,
      child: Text(
        model.description!,
        style: AssetFonts.bold(),
      ),
    );
  }

  Widget _buildDate() {
    return Padding(
      padding: paddingHorizontal,
      child: Text(
        model.publishedAt.toDateAndTime(),
        style: AssetFonts.light(fontSize: 14),
      ),
    );
  }

  Widget _buildAuthor() {
    if (model.author == null) return Container();
    return Padding(
      padding: paddingHorizontal,
      child: Text(
        "By ${model.author!}",
        style: AssetFonts.bold(fontSize: 16).copyWith(letterSpacing: 1.2),
      ),
    );
  }

  Widget _buildNewsContent() {
    List<String> list = model.content.split(" [");

    TextStyle regularStyle = AssetFonts.regular();

    return Padding(
      padding: paddingHorizontal,
      child: list.length != 2
          ? Text(
              model.content,
              style: regularStyle,
            )
          : RichText(
              text: TextSpan(
                text: "${list[0]} ",
                style: regularStyle,
                children: [
                  TextSpan(
                    text: 'Read more',
                    style: regularStyle.copyWith(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                    recognizer: new TapGestureRecognizer()..onTap = goToWebView,
                  )
                ],
              ),
            ),
    );
  }

  void goToWebView() {
    Get.to(() => WebviewPage(initialUrl: model.url));
  }
}
