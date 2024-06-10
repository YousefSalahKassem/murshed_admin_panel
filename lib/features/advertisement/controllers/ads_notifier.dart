import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed_admin_panel/core/errors/firebase_exceptions.dart';
import 'package:murshed_admin_panel/core/notifiers/global_state.dart';
import 'package:murshed_admin_panel/features/advertisement/data/interface/i_ads_service.dart';

class AdsNotifier extends StateNotifier<GlobalStates<List<String>>> {
  final IAdsService _adsService;
  static final provider = StateNotifierProvider.autoDispose<AdsNotifier,
      GlobalStates<List<String>>>(
    (ref) => AdsNotifier(
      ref.watch(IAdsService.provider),
    ),
  );

  AdsNotifier(this._adsService) : super(GlobalStates.initial()) {
    getAds();
  }

  Future<void> getAds() async {
    try {
      state = GlobalStates.loading();
      final result = await _adsService.getAds();
      state = GlobalStates.success(
        result,
      );
    } on FirebaseExceptions catch (e) {
      state = GlobalStates.fail(FirebaseExceptions.handleFirebaseException(e));
    }
  }
}
