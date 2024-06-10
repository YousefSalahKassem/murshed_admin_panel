import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class RouteGuard {
  const RouteGuard();

  FutureOr<String?> call(BuildContext context, GoRouterState state);
}
