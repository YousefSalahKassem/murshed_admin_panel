import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murshed_admin_panel/core/service/remote/generic_i_service.dart';
import 'package:murshed_admin_panel/core/service/remote/generic_service.dart';

class ServiceFactory {
  final String key;
  static final provider = Provider.family<ServiceFactory,String>(
    (ref,key) => ServiceFactory(key),
  );
  final Map<Type, WeakReference<GenericIService>> _services = {};

  ServiceFactory(this.key);

  GenericIService<T> get<T>() {
    var service = _services[T]?.target;
    if (service == null) {
      service = GenericService<T>(FirebaseFirestore.instance, key);
      _services[T] = WeakReference(service);
    }
    return service as GenericIService<T>;
  }
}
