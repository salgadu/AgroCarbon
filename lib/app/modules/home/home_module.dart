import 'package:calculadora_agrocarbon/app/modules/carbon/carbon_module.dart';
import 'package:calculadora_agrocarbon/app/modules/density/density_module.dart';
import 'package:calculadora_agrocarbon/app/modules/mos/mos_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  List<Module> get imports => [];

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
      children: [
        ModuleRoute('/mos', module: MosModule()),
        ModuleRoute('/density', module: DensityModule()),
        ModuleRoute('/carbon', module: CarbonModule()),
      ],
      transition: TransitionType.noTransition,
    );
  }
}
