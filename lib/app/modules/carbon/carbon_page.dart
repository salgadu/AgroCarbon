import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'carbon_store.dart';

class CarbonPage extends StatefulWidget {
  const CarbonPage({super.key});

  @override
  State<CarbonPage> createState() => _CarbonPageState();
}

class _CarbonPageState extends State<CarbonPage> {
  final CarbonStore store = Modular.get<CarbonStore>();

  final _coController = TextEditingController();
  final _dsController = TextEditingController();
  final _eController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Estoque de Carbono (ESTC)',
              style: textTheme.headlineSmall?.copyWith(
                color: colorScheme.primary,
              ),
              textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text('Fórmula: ESTC = (CO × Ds × e) / 10',
              style: textTheme.titleMedium, textAlign: TextAlign.center),
          // const SizedBox(height: 4),
          // Text('(Verifique a fórmula correta antes de usar)',
          //     style: textTheme.bodySmall?.copyWith(color: colorScheme.error),
          //     textAlign: TextAlign.center),
          const SizedBox(height: 24),

          // Inputs
          TextField(
            controller: _coController,
            onChanged: (value) => store.coInput = value,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Carbono Orgânico (CO %)',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.eco_outlined),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _dsController,
            onChanged: (value) => store.dsInput = value,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Densidade do Solo (Ds g/cm³)',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.layers_outlined),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _eController,
            onChanged: (value) => store.eInput = value,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Espessura (e) em cm',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.vertical_align_bottom),
            ),
          ),
          const SizedBox(height: 16),

          // Botão
          Observer(
            builder: (_) {
              return FilledButton.tonal(
                onPressed: store.canCalculate ? store.calculateEstc : null,
                child: const Text('CALCULAR ESTC'),
              );
            },
          ),
          const SizedBox(height: 24),

          Observer(
            builder: (_) {
              return PageTransitionSwitcher(
                transitionBuilder:
                    (child, primaryAnimation, secondaryAnimation) {
                  return SharedAxisTransition(
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.vertical,
                    child: child,
                  );
                },
                child: (store.estcResult != null)
                    ? Card(
                        elevation: 0,
                        color: colorScheme.primaryContainer,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'ESTC = ${store.estcResult!.toStringAsFixed(2)} Mg/ha', //
                            style: textTheme.titleLarge?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : const SizedBox(key: ValueKey('placeholder')),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _coController.dispose();
    _dsController.dispose();
    _eController.dispose();
    super.dispose();
  }
}
