import 'package:calculadora_agrocarbon/app/core/theme/theme_store.dart';
import 'package:calculadora_agrocarbon/app/modules/mos/mos_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ThemeStore themeStore = Modular.get<ThemeStore>();
  final MosStore mosStore = Modular.get<MosStore>();

  int _currentIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        Modular.to.navigate('/mos');
        break;
      case 1:
        Modular.to.navigate('/density');
        break;
      case 2:
        Modular.to.navigate('/carbon');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        // 1. Título alinhado à esquerda
        centerTitle: false,

        // 2. "AGRO" em verde usando Text.rich
        title: Text.rich(
          TextSpan(
            text: 'Calculadora ',
            // Herda o estilo padrão do AppBar
            style: Theme.of(context).appBarTheme.titleTextStyle ??
                const TextStyle(fontSize: 20),
            children: [
              TextSpan(
                text: 'AGRO',
                style: TextStyle(
                  color: colorScheme.primary, // Cor verde solicitada
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: 'carbon',
              ),
            ],
          ),
        ),
        actions: [
          Observer(
            builder: (_) {
              return IconButton(
                onPressed: themeStore.toggleTheme,
                icon: Icon(
                  themeStore.isDark ? Icons.light_mode : Icons.dark_mode,
                ),
                tooltip: 'Alterar Tema',
              );
            },
          ),

          // 3. Menu de Opções (Três pontinhos)
          PopupMenuButton<String>(
            tooltip: 'Opções',
            onSelected: (value) {
              if (value == 'about') {
                // Navega para a página Sobre
                // Certifique-se de registrar a rota '/about' no seu módulo
                Modular.to.pushNamed('/about');
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                value: 'about',
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.grey),
                    SizedBox(width: 8),
                    Text('Sobre'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: const RouterOutlet(),
      bottomNavigationBar: Observer(
        builder: (_) {
          final isCot = mosStore.isCotMode;
          final label0 = isCot ? 'COT' : 'MOS';
          final icon0 = isCot ? Icons.science_outlined : Icons.eco_outlined;
          final activeIcon0 = isCot ? Icons.science : Icons.eco;

          return BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onBottomNavTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(icon0),
                activeIcon: Icon(activeIcon0),
                label: label0,
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.layers_outlined),
                activeIcon: Icon(Icons.layers),
                label: 'Densidade',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.dns_outlined),
                activeIcon: Icon(Icons.dns),
                label: 'Carbono',
              ),
            ],
          );
        },
      ),
    );
  }
}
