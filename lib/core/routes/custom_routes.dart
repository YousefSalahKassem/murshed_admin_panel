import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:murshed_admin_panel/core/routes/animation/fade_animation_page.dart';
import 'package:murshed_admin_panel/core/routes/guards/authentication_guard.dart';
import 'package:murshed_admin_panel/core/routes/route_observer.dart';
import 'package:murshed_admin_panel/features/authentication/screens/login_screen.dart';
import 'package:murshed_admin_panel/features/home/screens/home_screen.dart';

mixin AppRouter {
  static final observerProvider = Provider((ref) => AppRouteObserver());
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorKey = GlobalKey<NavigatorState>();

  static final provider = Provider(
        (ref) {
      final observer = ref.watch(observerProvider);
      return GoRouter(
        initialLocation: '/',
        observers: [observer],
        navigatorKey: navigatorKey,
        routes: [
          GoRoute(
            path: LoginScreen.routePath,
            name: LoginScreen.routeName,
            pageBuilder: (context, state) => fadeAnimationPage(
              pageKey: state.pageKey,
              screen: const LoginScreen(),
            ),
          ),
          GoRoute(
            path: HomeScreen.routePath,
            name: HomeScreen.routeName,
            pageBuilder: (context, state) => fadeAnimationPage(
              pageKey: state.pageKey,
              screen: const HomeScreen(),
            ),
          ),
        ],
        redirect: (context, state) => const AuthenticationGuard().call(context, state),
      );
    },
  );
}
