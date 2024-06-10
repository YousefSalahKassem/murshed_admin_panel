import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:murshed_admin_panel/core/components/text_input_field.dart';
import 'package:murshed_admin_panel/core/utilities/extensions.dart';
import 'package:murshed_admin_panel/core/utilities/snackbar.dart';
import 'package:murshed_admin_panel/core/utilities/validations.dart';
import 'package:murshed_admin_panel/features/authentication/controllers/auth_controller.dart';
import 'package:murshed_admin_panel/features/authentication/controllers/login_data_holder.dart';
import 'package:murshed_admin_panel/generated/locale_keys.g.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(AuthController.provider, (previous, next) {
      if (next.isLoading) {
        context.loaderOverlay.show();
      } else if (next.isSuccess) {
        context.loaderOverlay.hide();
        context.go('/');
      } else if (next.isFailed) {
        context.loaderOverlay.hide();
        CustomSnackBar.showError(context, next.error.toString());
      }
    });
    final loginDataHolder = ref.read(LoginDataHolder.provider.notifier);
    return Form(
      key: loginDataHolder.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextInputField(
            hint: "example@gmail.com",
            prefixIcon: Padding(
              padding: EdgeInsets.all(16.w),
              child: const Icon(Icons.person),
            ),
            validator: (value) => value!.validate([
              validateRequired,
            ]),
            controller: loginDataHolder.emailController,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: TextInputField(
              isPassword: true,
              controller: loginDataHolder.passwordController,
              hint: "************",
              prefixIcon: Padding(
                padding: EdgeInsets.all(16.w),
                child: const Icon(Icons.lock),
              ),
              validator: (value) => value!.validate([
                validateRequired,
              ]),
            ),
          ),
          16.verticalSpace,
          ElevatedButton(
            onPressed: () {
              ref.read(AuthController.provider.notifier).login();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 22.h,
              ),
              child: Text(
                LocaleKeys.languageSelection_login.tr(),
              ),
            ),
          ),
          16.verticalSpace,
        ],
      ),
    );
  }
}
