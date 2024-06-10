import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed_admin_panel/core/notifiers/global_state.dart';
import 'package:murshed_admin_panel/features/advertisement/data/interface/i_ads_service.dart';

class AdsProvider extends StateNotifier<GlobalStates<void>> {
  static final provider =
      StateNotifierProvider<AdsProvider, GlobalStates<void>>(
    (ref) => AdsProvider(
      ref.watch(IAdsService.provider),
    ),
  );

  final IAdsService _service;

  AdsProvider(
    this._service,
  ) : super(GlobalStates.initial());

  Future<void> addAds() async {
    try {
      state = GlobalStates.loading();
      await _service.addAd('');
      state = GlobalStates.success(null);
    } on FirebaseException catch (e) {
      state = GlobalStates.fail(e.message);
    }
  }

  Future<void> deleteCity(String ad) async {
    try {
      state = GlobalStates.loading();
      await _service.deleteAd(ad);
      state = GlobalStates.success(null);
    } on FirebaseException catch (e) {
      state = GlobalStates.fail(e.message);
    }
  }
}
