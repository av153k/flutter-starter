import 'package:flutter_starter/app/app_deps_container.dart';

class AppContainer {
  AppContainer(this._depsContainer);

  final AppDepsContainer _depsContainer;

  AppDepsContainer get deps => _depsContainer;

}
