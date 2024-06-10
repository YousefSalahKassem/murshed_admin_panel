import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murshed_admin_panel/core/themes/app_sizes.dart';
import 'package:murshed_admin_panel/core/themes/app_text_styles.dart';
import 'package:murshed_admin_panel/core/themes/app_theme_flavor.dart';
import 'package:murshed_admin_panel/core/themes/data.dart';
import 'package:murshed_admin_panel/core/utilities/extensions.dart';

part 'light_color.dart';

class LightTheme extends AppThemeFlavor {
  LightTheme() : super.init();

  @override
  ThemeData createThemeData(BuildContext context) {
    final appSizes = context.isTablet ? AppSizes.tablet() : AppSizes.mobile();
    final appTextStyle =
        context.isTablet ? AppTextStyles.tablet() : AppTextStyles.mobile();
    final textTheme = appTextStyle.toTextTheme().apply(
          fontFamily: 'Inter',
          displayColor: LightColors.black,
          bodyColor: LightColors.black,
          decorationColor: LightColors.black,
        );
    return ThemeData.from(colorScheme: ColorScheme.fromSwatch()).copyWith(
      scaffoldBackgroundColor: LightColors.background,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        elevation: 10,
        foregroundColor: LightColors.primary,
        surfaceTintColor: LightColors.white,
        backgroundColor: LightColors.background,
        titleSpacing: 0,
        titleTextStyle: appTextStyle.headlineLarge.copyWith(
          color: LightColors.primary,
        ),
      ),
      dividerColor: Colors.grey.shade100,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: LightColors.primary,
          foregroundColor: LightColors.white,
          textStyle: appTextStyle.subheadLarge,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all<Color>(LightColors.white),
        checkColor: MaterialStateProperty.all<Color>(LightColors.white),
        overlayColor: MaterialStateProperty.all<Color>(
          LightColors.white,
        ),
        side: BorderSide(
          color: LightColors.secondaryVariant,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: LightColors.background,
        unselectedItemColor: LightColors.secondaryVariant,
        selectedItemColor: LightColors.primary,
        enableFeedback: false,
        elevation: 1,
      ),
      cardTheme: CardTheme(
        color: LightColors.white,
        surfaceTintColor: LightColors.white,
        elevation: 0,
      ),
      iconTheme: IconThemeData(
        color: LightColors.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: LightColors.white,
        suffixIconColor: LightColors.white,
        errorStyle: appTextStyle.bodyMedium.copyWith(
          color: LightColors.error,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Color(0XFF717171),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Color(0XFF717171),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Color(0XFF717171),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Color(0XFF717171),
          ),
        ),
        iconColor: LightColors.primary,
        prefixIconColor: const Color(0xFF3a3a6e),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: LightColors.primary,
        labelStyle: appTextStyle.titleLarge,
        unselectedLabelColor: LightColors.black,
        unselectedLabelStyle: appTextStyle.titleMedium,
        indicatorColor: LightColors.primary,
        dividerColor: LightColors.white.withOpacity(0.2),
      ),
      extensions: [
        appTextStyle,
        appSizes,
        AppThemeData(
          white: LightColors.white,
          black: LightColors.black,
          blue: LightColors.blue,
          primary: LightColors.primary,
          primaryVariant: LightColors.primaryVariant,
          secondary: LightColors.secondary,
          secondaryVariant: LightColors.secondaryVariant,
          error: LightColors.error,
          primaryError: LightColors.errorPrimary,
          secondaryError: LightColors.errorSecondary,
          success: LightColors.success,
          primarySuccess: LightColors.successPrimary,
          secondarySuccess: LightColors.successSecondary,
          warning: LightColors.warning,
          background: LightColors.background,
          secondaryBackground: LightColors.secondaryBackground,
          entryScreenButtons: LightColors.entryScreenButtons,
          languageSelectionButton: LightColors.languageSelectionButton,
          ads: LightColors.ads,
          adsPrimary: LightColors.adsPrimary,
          adsSecondary: LightColors.adsSecondary,
        ),
      ],
    );
  }

  @override
  Brightness get windowBrightness => Brightness.dark;
}
