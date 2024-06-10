import 'dart:ui';
import 'package:murshed_admin_panel/core/utilities/defs.dart';

abstract class GenericIService<T> {

  Future<List<T>> getAll({
    String? query,
    Locale? locale,
    required GenericFromJson<T> fromJson,
  });

  Future<void> delete({required String id});

  Future<void> update({
    required String id,
    required Map<String, dynamic> data,
  });

  Future<void> add({
    required Map<String, dynamic> data,
  });
}
