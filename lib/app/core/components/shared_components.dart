import 'package:animations/animations.dart';
import 'package:calculadora_agrocarbon/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// 1. Header Estilizado
class StyledHeader extends StatelessWidget {
  final String title;
  final String formula;
  final IconData icon;
  final Color themeColor;

  const StyledHeader({
    super.key,
    required this.title,
    required this.formula,
    required this.icon,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = AppTheme.getTipColor(context, themeColor);

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: effectiveColor.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            icon,
            color: effectiveColor,
            size: 28,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  title,
                  key: ValueKey(title),
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  formula,
                  key: ValueKey(formula),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: 'monospace', // Fonte matemática
                    fontWeight: FontWeight.w600, // Mais destaque
                    color: effectiveColor, // Usa a cor da seção
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// 2. Botão de Calcular (Atualizado para suportar ícone customizado)
class CalculateButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool isEnabled;
  final Color? color;
  final IconData icon; // Novo parâmetro

  const CalculateButton({
    super.key,
    required this.onPressed,
    this.label = 'CALCULAR',
    this.isEnabled = true,
    this.color,
    this.icon = Icons.calculate, // Padrão
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final btnColor = color != null
        ? AppTheme.getTipColor(context, color!)
        : theme.colorScheme.primary;

    return FilledButton.icon(
      onPressed: isEnabled
          ? () {
              FocusScope.of(context).unfocus();
              if (onPressed != null) onPressed!();
            }
          : null,
      icon: Icon(icon),
      label: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      style: FilledButton.styleFrom(
        backgroundColor: btnColor,
        foregroundColor: theme.colorScheme.onPrimary, // Garante contraste
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

// ... Mantenha GradientResultCard, VolumeResultCard, TipCard e CalculationTypeSwitch iguais ...
// (Copie o restante do código anterior se necessário, focando nas mudanças acima)
class GradientResultCard extends StatelessWidget {
  final String? value;
  final String unit;
  final String label;
  final String subLabel;
  final Color colorStart;
  final Color colorEnd;

  const GradientResultCard({
    super.key,
    required this.value,
    required this.unit,
    required this.label,
    this.subLabel = '',
    required this.colorStart,
    required this.colorEnd,
  });

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
        return SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.scaled,
          child: child,
        );
      },
      child: (value != null)
          ? Container(
              key: ValueKey(value),
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [colorStart, colorEnd],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: colorStart.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        value!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1.0,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        unit,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  if (subLabel.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      subLabel,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 14,
                      ),
                    ),
                  ]
                ],
              ),
            )
          : const SizedBox(key: ValueKey('placeholder')),
    );
  }
}

class VolumeResultCard extends StatelessWidget {
  final String? value;
  final Color themeColor;

  const VolumeResultCard({
    super.key,
    required this.value,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    if (value == null) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final effectiveColor = AppTheme.getTipColor(context, themeColor);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
            color: effectiveColor.withValues(alpha: isDark ? 0.5 : 0.3),
            width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Volume calculado',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value!,
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'cm³',
                style: TextStyle(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TipCard extends StatelessWidget {
  final String text;
  final Color color;

  const TipCard({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final effectiveColor = AppTheme.getTipColor(context, color);
    final backgroundColor =
        effectiveColor.withValues(alpha: isDark ? 0.15 : 0.1);
    final textColor = isDark ? theme.colorScheme.onSurface : Colors.black87;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: effectiveColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: RichText(
        text: TextSpan(
          style: theme.textTheme.bodyMedium?.copyWith(
            color: textColor,
            height: 1.5,
          ),
          children: [
            TextSpan(
              text: 'Dica: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: effectiveColor,
              ),
            ),
            TextSpan(text: text),
          ],
        ),
      ),
    );
  }
}

class CalculationTypeSwitch<T> extends StatelessWidget {
  final T selectedValue;
  final Map<T, String> options;
  final ValueChanged<T> onChanged;
  final Color activeColor;

  const CalculationTypeSwitch({
    super.key,
    required this.selectedValue,
    required this.options,
    required this.onChanged,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = AppTheme.getTipColor(context, activeColor);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 24),
      child: SegmentedButton<T>(
        segments: options.entries.map((entry) {
          return ButtonSegment<T>(
            value: entry.key,
            label: Text(entry.value),
          );
        }).toList(),
        selected: {selectedValue},
        onSelectionChanged: (Set<T> newSelection) {
          onChanged(newSelection.first);
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.selected)) {
              return effectiveColor.withValues(alpha: 0.2);
            }
            return null;
          }),
          foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.selected)) {
              return effectiveColor; // Cor do texto selecionado
            }
            return theme.colorScheme.onSurfaceVariant;
          }),
          side: WidgetStateProperty.resolveWith<BorderSide?>((states) {
            return BorderSide(
                color: states.contains(WidgetState.selected)
                    ? effectiveColor
                    : theme.colorScheme.outlineVariant);
          }),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        showSelectedIcon: false,
      ),
    );
  }
}
