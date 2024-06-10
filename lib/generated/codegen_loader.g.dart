// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "appName": "Murshed - مرشد",
  "languageSelection": {
    "title": "Choose the language you\nprefer",
    "arabic": "العربية",
    "english": "English",
    "next": "Next",
    "login": "Login"
  }
};
static const Map<String,dynamic> ar = {
  "appName": "Murshed - مرشد",
  "languageSelection": {
    "title": "أختر اللغة التي تفضلها",
    "arabic": "العربية",
    "english": "English",
    "next": "التالي",
    "login": "تسجيل الدخول"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
