import 'package:flutter_news/biz/constants.dart';
import 'package:flutter_news/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountController extends GetxController {
  late String name;

  AccountController() {
    name = GetStorage().read(Constants.USERNAME_KEY) ?? "";
  }

  String get getHighlightName {
    try {
      if (name.isEmpty) return "";
      name = name.trim();
      if (name.length == 1) return "$name";
      var list = name.split(" ");
      var letterFirst = "";
      var letterSec = "";
      if (list.length > 0) {
        letterFirst = list[0].substring(0, 1);
        try {
          letterSec = list[list.length - 1].substring(0, 1);
        } catch (e) {
          letterSec = "";
        }

        return "$letterFirst$letterSec";
      }
    } catch (e) {
      return "";
    }
    return "";
  }

  void logoutPress() async {
    await GetStorage().remove(Constants.USER_PREFERENCE_KEY);
    await GetStorage().remove(Constants.USERNAME_KEY);
    Get.offAllNamed(Routes.AUTHENTICATION);
  }
}
