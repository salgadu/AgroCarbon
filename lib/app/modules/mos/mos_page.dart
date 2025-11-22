import 'package:calculadora_agrocarbon/app/core/components/shared_components.dart';
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
  final _inputController = TextEditingController();

  final Color _themeColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Observer(
        builder: (_) {
          final isCotMode = store.isCotMode;
          final hasResult =
              store.resultValue != null; // Verifica se tem resultado

          final title =
              isCotMode ? 'Carbono Orgânico Total' : 'Matéria Orgânica do Solo';
          final formula = isCotMode ? 'COT = MOS × 0,58' : 'MOS = COT × 1,724';
          final inputLabel =
              isCotMode ? 'Matéria Orgânica (MOS)' : 'Carbono Orgânico (COT)';

          // Lógica do Label do Botão
          final btnLabel = hasResult
              ? 'LIMPAR CÁLCULO'
              : (isCotMode ? 'CALCULAR COT' : 'CALCULAR MOS');

          const resultUnit = 'g/100 g';
          final resultLabel = isCotMode ? 'COT Calculado' : 'MOS Calculada';
          final resultSubLabel =
              isCotMode ? 'Carbono Orgânico Total' : 'Matéria Orgânica do Solo';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculationTypeSwitch<MosCalculationType>(
                selectedValue: store.calculationType,
                activeColor: _themeColor,
                options: const {
                  MosCalculationType.calculateMos: 'Calcular MOS',
                  MosCalculationType.calculateCot: 'Calcular COT',
                },
                onChanged: (type) {
                  _inputController.clear();
                  store.setCalculationType(type);
                },
              ),

              StyledHeader(
                title: title,
                formula: formula,
                icon: isCotMode ? Icons.science : Icons.eco,
                themeColor: _themeColor,
              ),
              const SizedBox(height: 32),

              TextField(
                controller: _inputController,
                onChanged: store.setInputValue,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.done,
                // Desabilita edição se tiver resultado (opcional, mas bom UX)
                readOnly: hasResult,
                onSubmitted: (_) {
                  if (store.canCalculate && !hasResult) {
                    FocusScope.of(context).unfocus();
                    store.calculate();
                  }
                },
                decoration: InputDecoration(
                  labelText: inputLabel,
                  suffixText: 'g/100 g',
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(isCotMode ? Icons.grass : Icons.grid_3x3),
                  // Muda a cor se estiver calculado para indicar estado "travado"
                  filled: hasResult,
                  fillColor: Colors.grey.withValues(alpha: 0.1),
                ),
              ),
              const SizedBox(height: 24),

              // --- BOTÃO COM DUPLA FUNÇÃO ---
              CalculateButton(
                // Se tem resultado, chama clear e limpa o controller
                onPressed: hasResult
                    ? () {
                        store.clear();
                        _inputController.clear();
                      }
                    : store.calculate,
                // Se tem resultado, sempre habilitado. Se não, depende dos inputs
                isEnabled: hasResult || store.canCalculate,
                label: btnLabel,
                // Cor de alerta se for limpar, cor do tema se for calcular
                color: hasResult ? Colors.red.shade400 : _themeColor,
                icon: hasResult ? Icons.refresh : Icons.calculate,
              ),
              const SizedBox(height: 32),

              if (hasResult)
                Column(
                  children: [
                    GradientResultCard(
                      value: store.resultValue?.toStringAsFixed(2),
                      unit: resultUnit,
                      label: resultLabel,
                      subLabel: resultSubLabel,
                      colorStart: Colors.green.shade600,
                      colorEnd: Colors.green.shade400,
                    ),
                    const TipCard(
                      text:
                          'COT e MOS são cálculos complementares e devem sempre estar expressos na mesma unidade (g/100 g).',
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
    _inputController.dispose();
    super.dispose();
  }
}
