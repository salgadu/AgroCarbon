import 'package:calculadora_agrocarbon/app/core/components/shared_components.dart';
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

  final Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Observer(
        builder: (_) {
          // Atualizado para observar a nova variável resultKgM2
          final hasResult = store.resultKgM2 != null;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StyledHeader(
                title: 'Estoque de Carbono',
                // Fórmula visual atualizada
                formula: 'ESTC = (CO × Ds × e) / 10',
                icon: Icons.dns_outlined,
                themeColor: _themeColor,
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _coController,
                onChanged: (v) => store.coInput = v,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                textInputAction: TextInputAction.next,
                readOnly: hasResult,
                decoration: InputDecoration(
                  labelText: 'Carbono Orgânico (CO)',
                  // Sufixo alterado conforme solicitado
                  suffixText: 'g/100 g',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.eco_outlined),
                  filled: hasResult,
                  // Mantendo sua preferência por withValues
                  fillColor: Colors.grey.withValues(alpha: 0.1),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _dsController,
                onChanged: (v) => store.dsInput = v,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                textInputAction: TextInputAction.next,
                readOnly: hasResult,
                decoration: InputDecoration(
                  labelText: 'Densidade do Solo (Ds)',
                  suffixText: 'g/cm³',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.layers_outlined),
                  filled: hasResult,
                  fillColor: Colors.grey.withValues(alpha: 0.1),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _eController,
                onChanged: (v) => store.eInput = v,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                textInputAction: TextInputAction.done,
                readOnly: hasResult,
                onSubmitted: (_) {
                  if (store.canCalculate && !hasResult) {
                    FocusScope.of(context).unfocus();
                    store.calculateEstc();
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Espessura da Camada (e)',
                  suffixText: 'cm',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.vertical_align_bottom),
                  filled: hasResult,
                  fillColor: Colors.grey.withValues(alpha: 0.1),
                ),
              ),
              const SizedBox(height: 24),
              CalculateButton(
                onPressed: hasResult
                    ? () {
                        store.clear();
                        _coController.clear();
                        _dsController.clear();
                        _eController.clear();
                      }
                    : store.calculateEstc,
                isEnabled: hasResult || store.canCalculate,
                label: hasResult ? 'LIMPAR CÁLCULO' : 'CALCULAR ESTOQUE',
                color: hasResult ? Colors.red.shade400 : _themeColor,
                icon: hasResult ? Icons.refresh : Icons.calculate,
              ),
              const SizedBox(height: 32),
              if (hasResult)
                Column(
                  children: [
                    GradientResultCard(
                      // Atualizado para usar resultKgM2 e nova unidade
                      value: store.resultKgM2?.toStringAsFixed(2),
                      unit: 'kg/m²',
                      label: 'Estoque de Carbono',
                      subLabel: 'Quilogramas por metro quadrado',
                      colorStart: Colors.teal.shade600,
                      colorEnd: Colors.teal.shade400,
                    ),
                    const TipCard(
                      text:
                          'O estoque de carbono varia conforme o tipo de solo e práticas de manejo. Valores mais altos indicam maior sequestro de carbono.',
                      color: Colors.amber,
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
    _coController.dispose();
    _dsController.dispose();
    _eController.dispose();
    super.dispose();
  }
}
