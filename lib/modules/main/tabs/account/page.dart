import 'package:flutter/material.dart';
import 'package:flutter_news/common/widgets/common_button.dart';
import 'package:flutter_news/common/widgets/widgets.dart';
import 'package:flutter_news/language/string_manager.dart';
import 'package:flutter_news/modules/main/tabs/account/controller.dart';
import 'package:flutter_news/theme/colors.dart';
import 'package:flutter_news/theme/fonts.dart';
import 'package:get/get.dart';

class AccountPage extends GetView {
  final AccountController controller = Get.put(AccountController());

  AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            buildHeight(16),
            _buildCircleName(),
            buildHeight(32),
            _buildUserName(),
            Expanded(child: Container()),
            _buildButton(),
            buildHeight(16),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleName() {
    return Container(
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.black38,
        shape: BoxShape.circle,
      ),
      height: 100,
      width: 100,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          controller.getHighlightName,
          style: AssetFonts.bold(color: AssetColors.colorBlack081F42, fontSize: 32),
        ),
      ),
    );
  }

  Widget _buildUserName() {
    return Text(
      controller.name,
      style: AssetFonts.bold(fontSize: 32),
    );
  }

  Widget _buildButton() {
    return CommonButton(
      title: StringManager.logout.tr,
      isFullWidth: true,
      borderColor: Colors.red,
      textColor: Colors.red,
      backgroundColor: Colors.white,
      onTap: controller.logoutPress,
    );
  }
}
