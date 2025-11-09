import 'package:calculadora_agrocarbon/app/modules/density/density_page.dart';
import 'package:calculadora_agrocarbon/app/modules/density/density_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DensityModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(DensityStore.new);
  }

  @override
  List<Module> get imports => [];

  @override
  void routes(r) => r.child('/', child: (context) => const DensityPage());
}
