import 'package:calculadora_agrocarbon/app/modules/carbon/carbon_module.dart';
import 'package:calculadora_agrocarbon/app/modules/density/density_module.dart';
import 'package:calculadora_agrocarbon/app/modules/home/about_page.dart';
import 'package:calculadora_agrocarbon/app/modules/mos/mos_module.dart';
import 'package:calculadora_agrocarbon/app/modules/mos/mos_store.dart'; // Importe a Store
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    // AQUI ESTÁ A CORREÇÃO:
    // Registramos o MosStore aqui para que ele seja um Singleton compartilhado
    // entre a HomePage (pai) e a MosPage (filho).
    i.addLazySingleton(MosStore.new);
  }

  @override
  List<Module> get imports => [MosModule(), DensityModule(), CarbonModule()];

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
    r.child('/about', child: (context) => const AboutPage());
  }
}
