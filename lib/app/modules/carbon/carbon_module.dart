import 'package:calculadora_agrocarbon/app/modules/carbon/carbon_page.dart';
import 'package:calculadora_agrocarbon/app/modules/carbon/carbon_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CarbonModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(CarbonStore.new);
  }

  @override
  List<Module> get imports => [];

  @override
  void routes(r) {
    r.child('/', child: (context) => const CarbonPage());
  }
}
