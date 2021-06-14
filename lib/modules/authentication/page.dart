import 'package:flutter/material.dart';
import 'package:flutter_news/common/widgets/common_button.dart';
import 'package:flutter_news/common/widgets/common_tab_bar.dart';
import 'package:flutter_news/common/widgets/common_textfield.dart';
import 'package:flutter_news/common/widgets/logo.dart';
import 'package:flutter_news/common/widgets/widgets.dart';
import 'package:flutter_news/language/string_manager.dart';
import 'package:flutter_news/modules/authentication/controller.dart';
import 'package:get/get.dart';

class AuthenticationPage extends GetView<AuthenticationController> {
  final EdgeInsets paddingHorizontal = EdgeInsets.symmetric(horizontal: 32.0);
  final FocusNode _passwordFocusNode = FocusNode();

  AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Column(
            children: [
              Hero(tag: "app_logo", child: AppLogo()),
              buildHeight(32),
              _buildTabBar(),
              buildHeight(16),
              _buildTabView(),
              buildHeight(32),
              _buildButton(),
              buildHeight(16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabView() {
    return Expanded(
      child: Column(
        children: [
          _buildTfUsername(),
          buildHeight(16),
          _buildTfPassword(),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: paddingHorizontal,
      child: CommonTabBar(
        tabController: controller.tabController,
        tabs: controller.tabs,
      ),
    );
  }

  Widget _buildTfUsername() {
    return Padding(
      padding: paddingHorizontal,
      child: Obx(
        () => CommonTextField(
          key: controller.keyUsername,
          stream: controller.usernameStream,
          hintText: controller.hintUsername,
          helperText:
          controller.isLogin.value ? "" : StringManager.usernameHintText.tr,
          onChanged: controller.changeUsername,
        ),
      ),
    );
  }

  Widget _buildTfPassword() {
    return Padding(
      padding: paddingHorizontal,
      child: Obx(
        () => CommonTextField(
          key: controller.keyPassword,
          focusNode: _passwordFocusNode,
          stream: controller.passwordStream,
          hintText: controller.hintPassword,
          onChanged: controller.changePassword,
          textInputAction: TextInputAction.done,
          obscureText: controller.isObscure.value,
          rightWidget: IconButton(
              onPressed: controller.changeObscurePassword,
              icon: Icon(controller.iconEyePassword)),
          onCompleted: () {
            _passwordFocusNode.unfocus();
            controller.buttonPress();
          },
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: paddingHorizontal,
      child: StreamBuilder<bool>(
          stream: controller.enableButtonStream,
          builder: (context, snapshot) {
            bool isEnable = snapshot.data ?? false;
            return Obx(
              () => CommonButton(
                title: controller.buttonText,
                onTap: isEnable ? controller.buttonPress : null,
                isFullWidth: true,
              ),
            );
          }),
    );
  }
}
