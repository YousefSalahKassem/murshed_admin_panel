import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed_admin_panel/core/notifiers/global_state.dart';
import 'package:murshed_admin_panel/core/service/remote/service_factory.dart';
import 'package:murshed_admin_panel/features/cities/controllers/city_data_holder.dart';
import 'package:murshed_admin_panel/features/cities/models/city.dart';

class CitiesProvider extends StateNotifier<GlobalStates<void>> {
  static final provider =
      StateNotifierProvider<CitiesProvider, GlobalStates<void>>(
    (ref) => CitiesProvider(
      ref.watch(ServiceFactory.provider('cities')),
      ref.watch(CityDataHolder.provider),
    ),
  );

  final ServiceFactory _service;
  final CityDataHolder _cityDataHolder;

  CitiesProvider(
    this._service,
    this._cityDataHolder,
  ) : super(GlobalStates.initial());

  Future<void> addCity(City city) async {
    if (_cityDataHolder.formKey.currentState!.validate()) {
      try {
        state = GlobalStates.loading();
        await _service.get<City>().add(data: city.toJson());
        state = GlobalStates.success(null);
      } on FirebaseException catch (e) {
        state = GlobalStates.fail(e.message);
      }
    }
  }

  Future<void> deleteCity(String id) async {
    try {
      state = GlobalStates.loading();
      await _service.get<City>().delete(id: id);
      state = GlobalStates.success(null);
    } on FirebaseException catch (e) {
      state = GlobalStates.fail(e.message);
    }
  }

  Future<void> updateCity(String id, City city) async {
    try {
      state = GlobalStates.loading();
      await _service.get<City>().update(
            id: id,
            data: city.toJson(),
          );
      state = GlobalStates.success(null);
    } on FirebaseException catch (e) {
      state = GlobalStates.fail(e.message);
    }
  }
}
