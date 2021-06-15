import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_news/biz/constants.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/utils/validators.dart';
import 'package:flutter_news/language/string_manager.dart';
import 'package:flutter_news/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rxdart/rxdart.dart' as rx;

class AuthenticationController extends GetxController
    with SingleGetTickerProviderMixin, Validators {
  late List<Tab> tabs;
  late TabController tabController;

  RxBool isLogin = true.obs;

  String get hintUsername => isLogin.value
      ? StringManager.hintUsernameLogin.tr
      : StringManager.hintUsernameSignup.tr;

  String get hintPassword => isLogin.value
      ? StringManager.hintPasswordLogin.tr
      : StringManager.hintPasswordSignup.tr;

  String get buttonText =>
      isLogin.value ? StringManager.login.tr : StringManager.signup.tr;

  Key get keyUsername => isLogin.value
      ? ValueKey("login_username_key")
      : ValueKey("signup_username_key");

  Key get keyPassword => isLogin.value
      ? ValueKey("login_password_key")
      : ValueKey("signup_password_key");

  RxBool isObscure = true.obs;

  IconData get iconEyePassword => isObscure.value
      ? Icons.remove_red_eye_outlined
      : Icons.remove_red_eye_rounded;

  rx.BehaviorSubject<String> _usernameController = rx.BehaviorSubject();

  Stream<String> get usernameStream =>
      _usernameController.stream.transform(validateUsername);

  Function(String) get changeUsername => _usernameController.add;
  bool enableButton = false;

  rx.BehaviorSubject<String> _passwordController = rx.BehaviorSubject();

  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);

  Function(String) get changePassword => _passwordController.add;

  Stream<bool> get enableButtonStream =>
      rx.Rx.combineLatest2(usernameStream, passwordStream,
          (String a, String b) {
        enableButton = isNotEmpty(a) && isNotEmpty(b);
        return enableButton;
      });

  @override
  void onInit() {
    super.onInit();

    tabs = [
      Tab(
        text: StringManager.login.tr,
      ),
      Tab(
        text: StringManager.signup.tr,
      ),
    ];

    tabController = TabController(length: tabs.length, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        isLogin.value = tabController.index == 0;
      }
    });
  }

  void buttonPress() {
    if (!enableButton) return;
    if (isLogin.value)
      loginPress();
    else
      signupPress();
  }

  void loginPress() async {
    void setError() {
      _usernameController.addError(StringManager.wrongUsernamePassword.tr);
      _passwordController.addError(StringManager.wrongUsernamePassword.tr);
    }

    String? _jsonCache = GetStorage().read(Constants.USER_PASS_KEY);
    if (_jsonCache == null) {
      setError();
      return;
    }
    String username = _usernameController.value;
    String password = _passwordController.value;
    Map<String, dynamic> mapUserPass = jsonDecode(_jsonCache);
    if (mapUserPass.containsKey(username) &&
        mapUserPass[username] == password) {
      await goToMain();
    } else {
      setError();
    }
  }

  void signupPress() async {
    String username = _usernameController.value;
    String password = _passwordController.value;
    String? _jsonCache = GetStorage().read(Constants.USER_PASS_KEY);
    if (_jsonCache == null) {
      Map<String, dynamic> mapUserPass = {username: password};
      await GetStorage().write(Constants.USER_PASS_KEY, jsonEncode(mapUserPass));
      await goToMain();
      return;
    }

    Map<String, dynamic> mapUserPass = jsonDecode(_jsonCache);
    if (mapUserPass.containsKey(username)) {
      _usernameController.addError(StringManager.duplicateUsername.tr);
    } else {
      mapUserPass[username] = password;
      await GetStorage().write(Constants.USER_PASS_KEY, jsonEncode(mapUserPass));
      await goToMain();
    }
  }

  void changeObscurePassword() {
    isObscure.value = !isObscure.value;
  }

  Future<void> goToMain() async {
    await GetStorage().write(Constants.USERNAME_KEY, _usernameController.value);
    Get.offAllNamed(Routes.MAIN);
  }

  @override
  void dispose() {
    _usernameController.close();
    _passwordController.close();
    super.dispose();
  }
}
