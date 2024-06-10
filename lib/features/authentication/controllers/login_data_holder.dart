import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginDataHolder extends ChangeNotifier {
  static final provider = ChangeNotifierProvider(
    (ref) => LoginDataHolder(),
  );

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
}
