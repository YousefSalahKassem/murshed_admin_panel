import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:murshed_admin_panel/features/advertisement/data/interface/i_ads_service.dart';

class AdsService extends IAdsService {
  final FirebaseFirestore _fireStore;

  AdsService(this._fireStore);

  @override
  Future<void> addAd(String ad) async {
    await _fireStore.collection('ads').add({
      'images': [ad]
    });
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAd(String ad) async {
    final snapshot = await _fireStore
        .collection('ads')
        .where('images', arrayContains: ad)
        .get();
    for (final doc in snapshot.docs) {
      await doc.reference.update({
        'images': FieldValue.arrayRemove([ad])
      });
    }
  }

  @override
  Future<List<String>> getAds() async {
    final snapshot = await _fireStore.collection('ads').get();

    final List<String> ads = snapshot.docs.expand((doc) {
      final List<dynamic> images = doc['images'] ?? [];
      return images.map((image) => image.toString());
    }).toList();

    return ads;
  }
}
