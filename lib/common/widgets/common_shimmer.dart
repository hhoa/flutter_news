import 'package:flutter/material.dart';
import 'package:flutter_news/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

class CommonShimmer extends StatelessWidget {
  final double radius;
  final Widget? child;

  CommonShimmer({this.radius = 6, this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Shimmer.fromColors(
        child: IgnorePointer(
          ignoring: true,
          child: Container(
              decoration: BoxDecoration(
                color: AssetColors.shimmerBaseColor,
              ),
              child: child ?? Container()),
        ),
        baseColor: AssetColors.shimmerBaseColor,
        highlightColor: AssetColors.shimmerHighlightColor,
      ),
    );
  }
}
