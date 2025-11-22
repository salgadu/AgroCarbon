import 'package:calculadora_agrocarbon/app/core/theme/app_theme.dart';
import 'package:calculadora_agrocarbon/app/core/theme/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Dica: Defina a rota inicial no Módulo, não no build.
    // Mas se precisar forçar aqui, ok.
    Modular.setInitialRoute('/mos');

    return Observer(
      builder: (_) {
        // Recuperamos a store DENTRO do observer ou fora, mas garantindo que é a Singleton
        final themeStore = Modular.get<ThemeStore>();

        return MaterialApp.router(
          title: 'Calculadora AGROcarbon', // Ajustei o nome
          debugShowCheckedModeBanner: false,

          // Temas definidos no AppTheme
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,

          // O Observer vai reconstruir este widget quando themeMode mudar
          themeMode: themeStore.themeMode,

          routerConfig: Modular.routerConfig,
        );
      },
    );
  }
}
