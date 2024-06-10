import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murshed_admin_panel/core/components/responsive.dart';
import 'package:murshed_admin_panel/features/authentication/screens/mobile_login_screen.dart';
import 'package:murshed_admin_panel/features/authentication/widgets/login_form.dart';
import 'package:murshed_admin_panel/features/authentication/widgets/login_screen_top_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const routeName = 'login_screen';
  static const routePath = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: const MobileLoginScreen(),
        desktop: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: LoginScreenTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450.w,
                      child: const LoginForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
