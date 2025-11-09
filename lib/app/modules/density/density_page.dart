import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'density_store.dart';

class DensityPage extends StatefulWidget {
  const DensityPage({super.key});

  @override
  State<DensityPage> createState() => _DensityPageState();
}

class _DensityPageState extends State<DensityPage> {
  final DensityStore store = Modular.get<DensityStore>();

  final _radiusController = TextEditingController();
  final _heightController = TextEditingController();
  final _massController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Densidade do Solo',
              style: textTheme.headlineSmall?.copyWith(
                color: colorScheme.primary,
              ),
              textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text('Fórmula: V = π × R² × h | Densidade = M / V',
              style: textTheme.titleMedium, textAlign: TextAlign.center),
          const SizedBox(height: 24),
          TextField(
            controller: _radiusController,
            onChanged: (value) => store.radiusInput = value,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Raio (R) em cm',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.circle_outlined),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _heightController,
            onChanged: (value) => store.heightInput = value,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Altura (h) em cm',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.height),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _massController,
            onChanged: (value) => store.massInput = value,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Massa seca do solo (M) em g',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.scale),
            ),
          ),
          const SizedBox(height: 16),
          Observer(
            builder: (_) {
              return FilledButton.tonal(
                onPressed: store.canCalculate ? store.calculateDensity : null,
                child: const Text('CALCULAR DENSIDADE'),
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
                child: (store.densityResult != null)
                    ? Card(
                        elevation: 0,
                        color: colorScheme.primaryContainer,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Densidade = ${store.densityResult!.toStringAsFixed(3)} g/cm³',
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
    _radiusController.dispose();
    _heightController.dispose();
    _massController.dispose();
    super.dispose();
  }
}
