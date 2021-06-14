import 'package:flutter/material.dart';
import 'package:flutter_news/theme/fonts.dart';

class CommonTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final String? hintText;
  final String? helperText;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final double radius;

  final bool enabled;
  final bool obscureText;
  final TextEditingController? textEditingController;
  final Stream<String>? stream;
  final TextInputAction textInputAction;
  final Function(String)? onChanged;
  final Function()? onCompleted;

  CommonTextField({
    Key? key,
    this.enabled = true,
    this.focusNode,
    this.textInputType,
    this.hintText,
    this.helperText,
    this.leftWidget,
    this.rightWidget,
    this.radius = 6,
    this.obscureText = false,
    this.textEditingController,
    this.stream,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.onCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: stream,
        builder: (context, snapshot) {
          return TextField(
            enabled: enabled,
            controller: textEditingController,
            focusNode: focusNode,
            keyboardType: textInputType,
            cursorColor: Colors.black,
            obscureText: obscureText,
            textInputAction: textInputAction,
            onChanged: onChanged,
            onEditingComplete: onCompleted,
            decoration: InputDecoration(
              prefixIcon: leftWidget,
              prefixIconConstraints: BoxConstraints(
                minWidth: 44,
                minHeight: 24,
              ),
              suffixIcon: rightWidget,
              suffixIconConstraints: BoxConstraints(
                minWidth: 44,
                minHeight: 24,
              ),
              errorText: snapshot.error as String? ?? null,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(color: Colors.red),
              ),
              fillColor: Colors.transparent,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(color: Colors.black45),
              ),
              hintText: hintText,
              hintStyle: AssetFonts.regular(
                  fontSize: 16, color: Colors.black.withOpacity(0.6)),
              helperText: helperText,
              helperStyle: AssetFonts.regular(
                  fontSize: 12, color: Colors.black.withOpacity(0.6)),
            ),
          );
        });
  }
}
