import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murshed_admin_panel/core/themes/app_assets.dart';
import 'package:murshed_admin_panel/core/utilities/extensions.dart';
import 'package:murshed_admin_panel/generated/locale_keys.g.dart';


class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          32.verticalSpace,
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: Image.asset(AppAssets.appLogo),
                ),
                const Spacer(),
              ],
            ),
          ),
          32.verticalSpace,
        ],
      ),
    );
  }
}