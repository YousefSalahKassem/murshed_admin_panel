import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed_admin_panel/app.dart';
import 'package:murshed_admin_panel/core/utilities/locale.dart';
import 'package:murshed_admin_panel/firebase_options.dart';
import 'package:murshed_admin_panel/generated/codegen_loader.g.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  setPathUrlStrategy();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: AppLocale.locales,
        path: 'assets/translations',
        assetLoader: const CodegenLoader(),
        startLocale: AppLocale.arabic,
        fallbackLocale: AppLocale.english,
        useOnlyLangCode: true,
        child: const MyApp(),
      ),
    ),
  );
}