import 'package:calculadora_agrocarbon/app/modules/mos/mos_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MosModule extends Module {
  @override
  void binds(i) {
    // i.addLazySingleton(MosStore.new); --- IGNORE ---
  }

  @override
  List<Module> get imports => [];

  @override
  void routes(r) => r.child('/', child: (context) => const MosPage());
}
