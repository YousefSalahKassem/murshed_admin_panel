import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:murshed_admin_panel/core/routes/guards/guard.dart';
import 'package:murshed_admin_panel/features/authentication/screens/login_screen.dart';

class AuthenticationGuard extends RouteGuard {
  const AuthenticationGuard();

  @override
  FutureOr<String?> call(BuildContext context, GoRouterState state) async {
    final isAuthenticated = FirebaseAuth.instance.currentUser != null;
    if (!isAuthenticated) {
      return LoginScreen.routePath;
    }
    return null;
  }
}
