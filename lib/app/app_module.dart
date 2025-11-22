import 'package:calculadora_agrocarbon/app/core/core_module.dart';
import 'package:calculadora_agrocarbon/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.module('/', module: HomeModule());
  }
}
