import 'dart:ui';
import 'package:murshed_admin_panel/core/utilities/defs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:murshed_admin_panel/core/service/remote/generic_i_service.dart';

class GenericService<T> extends GenericIService {
  final FirebaseFirestore _fireStore;
  final String key;

  GenericService(
    this._fireStore,
    this.key,
  );

  @override
  Future<void> add({required Map<String, dynamic> data}) async {
    await _fireStore.collection(key).add(data);
  }

  @override
  Future<void> delete({required String id}) async {
    await _fireStore.collection(key).doc(id).delete();
  }

  @override
  Future<void> update({
    required String id,
    required Map<String, dynamic> data,
  }) async {
    await _fireStore.collection(key).doc(id).update(data);
  }

  @override
  Future<List> getAll({
    String? query,
    Locale? locale,
    required GenericFromJson fromJson,
  }) async {
    QuerySnapshot querySnapshot;

    if (query != null && query.isNotEmpty) {
      String titleField = 'title.${locale!.languageCode}';

      querySnapshot = await _fireStore
          .collection(key)
          .where(titleField, isGreaterThanOrEqualTo: query)
          .where(titleField, isLessThanOrEqualTo: '$query\uf8ff')
          .get();
    } else {
      querySnapshot = await _fireStore.collection(key).get();
    }

    return querySnapshot.docs
        .map((doc) => fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
