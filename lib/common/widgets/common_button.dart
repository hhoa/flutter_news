import 'package:flutter/material.dart';
import 'package:flutter_news/theme/fonts.dart';

class CommonButton extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final Color? textColor;
  final Widget? child;
  final bool haveShadow;
  final Color? backgroundColor;
  final double radius;
  final bool isFullWidth;
  final EdgeInsets? padding;
  final Color borderColor;
  final double textSize;

  CommonButton({
    this.title,
    this.onTap,
    this.textColor,
    this.child,
    this.haveShadow = true,
    this.isFullWidth = false,
    this.backgroundColor,
    this.textSize = 18,
    this.radius = 28,
    this.padding,
    this.borderColor = Colors.transparent
  });

  @override
  Widget build(BuildContext context) {
    Widget widget = ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        textStyle: AssetFonts.medium(
            color: textColor ?? Colors.white, fontSize: textSize),
        shadowColor: Colors.black,
        elevation: haveShadow ? 4 : 0,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius), side: BorderSide(color: borderColor)),
      ),
      child: _buildChild(),
    );

    if (isFullWidth)
      return SizedBox(
        width: double.maxFinite,
        child: widget,
      );

    return widget;
  }

  Widget _buildChild() {
    return child ?? Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Text(
        title ?? "",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AssetFonts.medium(
            color: textColor ?? Colors.white, fontSize: textSize),
      ),
    );
  }
}
