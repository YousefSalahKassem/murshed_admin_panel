import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed_admin_panel/core/themes/app_sizes.dart';
import 'package:murshed_admin_panel/core/themes/app_text_styles.dart';
import 'package:murshed_admin_panel/core/themes/data.dart';
import 'package:murshed_admin_panel/core/themes/flavors/light/light_theme.dart';
import 'package:murshed_admin_panel/core/utilities/extensions.dart';

class AppTheme extends StatelessWidget {
  final Widget Function(ThemeData theme) builder;

  const AppTheme({super.key, required this.builder});

  static AppThemeData? maybeOf(BuildContext context) {
    return context.theme.extension<AppThemeData>();
  }

  static AppThemeData of(BuildContext context) {
    return maybeOf(context)!;
  }

  static AppSizes? maybeSizesOf(BuildContext context) {
    return context.theme.extension<AppSizes>();
  }

  static AppSizes sizesOf(BuildContext context) {
    return maybeSizesOf(context)!;
  }

  static AppTextStyles? maybeTextStyleOf(BuildContext context) {
    return context.theme.extension<AppTextStyles>();
  }

  static AppTextStyles textStyleOf(BuildContext context) {
    return maybeTextStyleOf(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final theme = LightTheme().createThemeData(context);
        return builder(theme);
      },
    );
  }
}
