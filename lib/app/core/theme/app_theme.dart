import 'package:flutter/material.dart';

class AppTheme {
  // Removemos a string _fontFamily hardcoded

  // --- CORES LIGHT ---
  static const ColorScheme _lightScheme = ColorScheme.light(
    primary: Colors.green,
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFA5D6A7),
    onPrimaryContainer: Color(0xFF003300),
    secondary: Color(0xFF2E7D32),
    onSecondary: Colors.white,
    tertiary: Color(0xFFFBC02D),
    onTertiary: Colors.black,
    error: Color(0xFFB00020),
    onError: Colors.white,
    surface: Color(0xFFF5F5F5),
    onSurface: Color(0xFF1E1E1E),
  );

  // --- CORES DARK ---
  static const ColorScheme _darkScheme = ColorScheme.dark(
    primary: Color(0xFF81C784),
    onPrimary: Color(0xFF003300),
    primaryContainer: Color(0xFF1B5E20),
    onPrimaryContainer: Color(0xFFA5D6A7),
    secondary: Color(0xFFA5D6A7),
    onSecondary: Color(0xFF003300),
    tertiary: Color(0xFFFFF59D),
    onTertiary: Color(0xFF333300),
    error: Color(0xFFCF6679),
    onError: Colors.black,
    surface: Color(0xFF121212),
    onSurface: Color(0xFFE0E0E0),
  );

  static final ThemeData light = _buildTheme(_lightScheme);
  static final ThemeData dark = _buildTheme(_darkScheme);

  // Método auxiliar para construir o tema aplicando a fonte
  static ThemeData _buildTheme(ColorScheme scheme) {
    final baseTheme = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: 'Outfit', // <--- ADICIONE ISSO PARA USAR A FONTE LOCAL
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: scheme.brightness == Brightness.dark
            ? const Color(0xFF1E1E1E)
            : Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: scheme.brightness == Brightness.dark ? 4 : 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );

    return baseTheme;
  }

  // Helper para dicas (mantido igual)
  static Color getTipColor(BuildContext context, Color baseColor) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (!isDark) return baseColor;
    return HSLColor.fromColor(baseColor).withLightness(0.7).toColor();
  }
}
