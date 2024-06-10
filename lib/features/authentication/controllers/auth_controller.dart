import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed_admin_panel/core/errors/firebase_exceptions.dart';
import 'package:murshed_admin_panel/core/notifiers/global_state.dart';
import 'package:murshed_admin_panel/features/authentication/controllers/login_data_holder.dart';
import 'package:murshed_admin_panel/features/authentication/data/interfaces/i_auth_service.dart';

class AuthController extends StateNotifier<GlobalStates<String>> {
  final IAuthService _authService;
  final LoginDataHolder _loginDataHolder;
  static final provider =
      StateNotifierProvider<AuthController, GlobalStates<String>>(
    (ref) => AuthController(
      ref.watch(IAuthService.provider),
      ref.watch(LoginDataHolder.provider),
    ),
  );

  AuthController(
    this._authService,
    this._loginDataHolder,
  ) : super(GlobalStates.initial());

  Future<void> logout() async {
    try {
      state = GlobalStates.loading();
      await _authService.logout();
      state = GlobalStates.success('');
    } on FirebaseAuthException catch (e) {
      state = GlobalStates.fail(FirebaseExceptions.handleAuthException(e));
    }
  }

  Future<bool> checkIfLoggedIn() async {
    return _authService.checkIfAuth();
  }

  Future<void> login() async {
    if (_loginDataHolder.formKey.currentState!.validate()) {
      try {
        state = GlobalStates.loading();
        await _authService.login(
          _loginDataHolder.emailController.text,
          _loginDataHolder.passwordController.text,
        );
        state = GlobalStates.success('');
      } on FirebaseAuthException catch (e) {
        state = GlobalStates.fail(FirebaseExceptions.handleAuthException(e));
      }
    }
  }
}
