// import 'package';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocalController extends GetxController {
  void changeLanguageGetx(String langcode) {
    Locale locale = Locale(langcode);
    Get.updateLocale(locale);
  }
}
