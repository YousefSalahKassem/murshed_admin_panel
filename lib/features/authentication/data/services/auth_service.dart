import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:murshed_admin_panel/features/authentication/data/interfaces/i_auth_service.dart';
import 'package:murshed_admin_panel/features/authentication/models/user_model.dart';

class AuthService extends IAuthService {
  final FirebaseAuth auth;

  AuthService(this.auth);

  @override
  Future<bool> checkIfAuth() async {
    return auth.currentUser != null;
  }

  @override
  Future<UserModel> getCurrentUserData() async {
    final userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser?.uid)
        .get();

    return UserModel.fromJson(userSnapshot.data()!);
  }

  @override
  Future<void> login(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }
}
