import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'mos_store.dart';

class MosPage extends StatefulWidget {
  const MosPage({super.key});

  @override
  State<MosPage> createState() => _MosPageState();
}

class _MosPageState extends State<MosPage> {
  final MosStore store = Modular.get<MosStore>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Matéria Orgânica do Solo (MOS)',
              style: textTheme.headlineSmall?.copyWith(
                color: colorScheme.primary,
              ),
              textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text('Fórmula: MOS (%) = COT (%) × 1,724',
              style: textTheme.titleMedium, textAlign: TextAlign.center),
          const SizedBox(height: 24),
          TextField(
            onChanged: store.setCot,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Carbono Orgânico Total (COT %)',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.numbers),
            ),
          ),
          const SizedBox(height: 16),
          Observer(
            builder: (_) {
              return FilledButton.tonal(
                onPressed: store.canCalculate ? store.calculateMos : null,
                child: const Text('CALCULAR MOS'),
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
                child: (store.mosResult != null)
                    ? Card(
                        elevation: 0,
                        color: colorScheme.primaryContainer,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'MOS = ${store.mosResult!.toStringAsFixed(2)} %',
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
}
