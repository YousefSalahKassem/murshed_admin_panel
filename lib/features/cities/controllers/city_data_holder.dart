import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CityDataHolder extends ChangeNotifier {
  static final provider = ChangeNotifierProvider((ref) => CityDataHolder());

  final cityArController = TextEditingController();
  final cityEnController = TextEditingController();
  final formKey = GlobalKey<FormState>();
}
