import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/theme/images.dart';

class CommonNetworkImage extends StatelessWidget {
  final String url;
  final double height;

  const CommonNetworkImage(this.url, {Key? key, this.height = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      errorWidget: (_, __, ___) => placeholder(),
      placeholder: (_, __) => placeholder(),
      width: double.maxFinite,
      height: 200,
      fit: BoxFit.cover,
    );
  }

  Widget placeholder() {
    return Image.asset(
      AssetImages.imgPlaceholder,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
