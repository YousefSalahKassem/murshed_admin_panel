import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed_admin_panel/core/errors/firebase_exceptions.dart';
import 'package:murshed_admin_panel/core/notifiers/global_state.dart';
import 'package:murshed_admin_panel/features/authentication/data/interfaces/i_auth_service.dart';
import 'package:murshed_admin_panel/features/authentication/models/user_model.dart';

class UserNotifier extends StateNotifier<GlobalStates<UserModel>> {
  final IAuthService _authService;
  static final provider =
      StateNotifierProvider.autoDispose<UserNotifier, GlobalStates<UserModel>>(
    (ref) => UserNotifier(
      ref.watch(IAuthService.provider),
    ),
  );

  UserNotifier(this._authService) : super(GlobalStates.initial()) {
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    try {
      state = GlobalStates.loading();
      final user = await _authService.getCurrentUserData();
      state = GlobalStates.success(
        user,
      );
    } on FirebaseAuthException catch (e) {
      state = GlobalStates.fail(FirebaseExceptions.handleAuthException(e));
    }
  }
}
