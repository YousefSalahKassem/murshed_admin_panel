import 'package:flutter/material.dart';
import 'package:murshed_admin_panel/core/themes/flavors/light/light_theme.dart';
import 'package:murshed_admin_panel/core/utilities/enums.dart';

abstract class AppThemeFlavor {
  factory AppThemeFlavor(ThemeFlavor themeFlavor) {
    return LightTheme();
  }

  Brightness get windowBrightness;

  ThemeData createThemeData(BuildContext context);

  @protected
  AppThemeFlavor.init();
}
