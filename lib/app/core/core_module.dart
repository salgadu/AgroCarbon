import 'package:calculadora_agrocarbon/app/core/theme/theme_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(ThemeStore.new);
  }
}
