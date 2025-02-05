// ignore_for_file: prefer_collection_literals

import 'dart:collection';
import 'dart:developer';

class AppDepsContainer {
  final _deps = LinkedHashMap<Type, dynamic>();

  final _tag = "AppDepsContainer";

  T register<T>(T instance) {
    _deps[T] = instance;
    log("[$_tag] - Registering dependency $T instance ");
    return instance;
  }

  void registerFactory<T>(T Function() factory) {
    _deps[T] = factory;
    log("[$_tag] - Registering dependency $T as a factory. It will be initialized when first resolved");
  }

  T resolve<T>() {
    final dep = _deps[T];
    if (dep != null) {
      if (dep is Function) {
        log("[$_tag] - Initializing dependency $T using its factory");
        final updatedDep = dep();
        _deps.remove(T);
        _deps[T] = updatedDep;
      } else if (dep is T) {
        return dep;
      }
    }

    throw AssertionError(
        "$T Dependecy not registered.\nYou have to register $T before accessing it.\nRegister it by calling ```AppContainer.deps.register(T())```");
  }
}
