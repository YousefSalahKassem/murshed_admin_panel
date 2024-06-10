import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed_admin_panel/features/authentication/data/services/auth_service.dart';
import 'package:murshed_admin_panel/features/authentication/models/user_model.dart';

abstract class IAuthService {
  static final provider =
      Provider<AuthService>((ref) => AuthService(FirebaseAuth.instance));

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();

  Future<bool> checkIfAuth();

  Future<UserModel> getCurrentUserData();
}
