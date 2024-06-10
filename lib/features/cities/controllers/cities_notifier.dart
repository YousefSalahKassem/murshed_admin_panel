import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed_admin_panel/core/notifiers/global_state.dart';
import 'package:murshed_admin_panel/core/service/remote/service_factory.dart';
import 'package:murshed_admin_panel/features/cities/models/city.dart';

class CitiesNotifier extends StateNotifier<GlobalStates<List<City>>> {
  static final provider =
      StateNotifierProvider<CitiesNotifier, GlobalStates<List<City>>>(
    (ref) => CitiesNotifier(
      ref.watch(ServiceFactory.provider('cities')),
    ),
  );

  final ServiceFactory _service;

  CitiesNotifier(this._service) : super(GlobalStates.initial()) {
    getCities();
  }

  Future<void> getCities({
    String? query,
    Locale? locale,
  }) async {
    state = GlobalStates.loading();
    try {
      final result = await _service.get<City>().getAll(
            fromJson: City.fromJson,
            query: query,
            locale: locale,
          );
      state = GlobalStates.success(result);
    } on FirebaseException catch (e) {
      state = GlobalStates.fail(e.message);
    }
  }
}
