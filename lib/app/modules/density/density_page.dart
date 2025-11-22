import 'package:calculadora_agrocarbon/app/core/components/shared_components.dart';
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

  final Color _themeColor = Colors.amber.shade800;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Observer(
        builder: (_) {
          final hasResult = store.densityResult != null;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StyledHeader(
                title: 'Densidade do Solo',
                formula: 'V = π × R² × h  |  Ds = M / V',
                icon: Icons.layers,
                themeColor: _themeColor,
              ),
              const SizedBox(height: 32),

              // Inputs (agora bloqueiam quando tem resultado)
              TextField(
                controller: _radiusController,
                onChanged: (value) => store.radiusInput = value,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.next,
                readOnly: hasResult,
                decoration: InputDecoration(
                  labelText: 'Raio do anel (R)',
                  suffixText: 'cm',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.circle_outlined),
                  filled: hasResult,
                  fillColor: Colors.grey.withValues(alpha: 0.1),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _heightController,
                onChanged: (value) => store.heightInput = value,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.next,
                readOnly: hasResult,
                decoration: InputDecoration(
                  labelText: 'Altura do anel (h)',
                  suffixText: 'cm',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.height),
                  filled: hasResult,
                  fillColor: Colors.grey.withValues(alpha: 0.1),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _massController,
                onChanged: (value) => store.massInput = value,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.done,
                readOnly: hasResult,
                onSubmitted: (_) {
                  if (store.canCalculate && !hasResult) {
                    FocusScope.of(context).unfocus();
                    store.calculateDensity();
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Massa seca do solo (M)',
                  suffixText: 'g',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.scale_outlined),
                  filled: hasResult,
                  fillColor: Colors.grey.withValues(alpha: 0.1),
                ),
              ),
              const SizedBox(height: 24),

              // Botão Transformável
              CalculateButton(
                onPressed: hasResult
                    ? () {
                        store.clear();
                        _radiusController.clear();
                        _heightController.clear();
                        _massController.clear();
                      }
                    : store.calculateDensity,
                isEnabled: hasResult || store.canCalculate,
                label: hasResult ? 'LIMPAR CÁLCULO' : 'CALCULAR DENSIDADE',
                color: hasResult ? Colors.red.shade400 : _themeColor,
                icon: hasResult ? Icons.refresh : Icons.calculate,
              ),
              const SizedBox(height: 32),

              if (hasResult)
                Column(
                  children: [
                    VolumeResultCard(
                      value: store.volumeResult?.toStringAsFixed(2),
                      themeColor: _themeColor,
                    ),
                    GradientResultCard(
                      value: store.densityResult?.toStringAsFixed(3),
                      unit: 'g/cm³',
                      label: 'Densidade',
                      colorStart: Colors.amber.shade700,
                      colorEnd: Colors.amber.shade500,
                    ),
                    const TipCard(
                      text:
                          'A densidade do solo geralmente varia entre 1,0 e 1,6 g/cm³ para solos agrícolas.',
                      color: Colors.green,
                    ),
                  ],
                ),
            ],
          );
        },
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
