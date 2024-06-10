import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'guard.dart';

class RouteGuardGroup extends RouteGuard {
  final List<RouteGuard> _guards;

  const RouteGuardGroup(this._guards);

  @override
  FutureOr<String?> call(BuildContext context, GoRouterState state) async {
    for (final guard in _guards) {
      final redirect = guard(context, state);
      if (redirect != null) return redirect;
    }
    return null;
  }
}
