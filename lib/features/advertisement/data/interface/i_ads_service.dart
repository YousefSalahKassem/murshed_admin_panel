import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed_admin_panel/features/advertisement/data/service/ads_service.dart';

abstract class IAdsService {
  static final provider = Provider(
    (ref) => AdsService(FirebaseFirestore.instance),
  );

  Future<void> addAd(String ad);

  Future<void> deleteAd(String ad);

  Future<List<String>> getAds();
}
