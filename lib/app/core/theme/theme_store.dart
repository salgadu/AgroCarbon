import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart'; // 1. Importar

part 'theme_store.g.dart';

class ThemeStore = ThemeStoreBase with _$ThemeStore;

abstract class ThemeStoreBase with Store {
  // Chave para salvar no banco local
  static const String _themeKey = 'is_dark';

  ThemeStoreBase() {
    // 2. Carregar o tema assim que a Store é criada
    _loadTheme();
  }

  @observable
  ThemeMode themeMode = ThemeMode.light;

  @computed
  bool get isDark => themeMode == ThemeMode.dark;

  @action
  Future<void> toggleTheme() async {
    // Troca o valor atual
    themeMode =
        (themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;

    // 3. Salva a nova preferência
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark);
  }

  @action
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    // Tenta ler se era dark (true) ou light (false).
    // Se não existir (primeira vez), assume false (light).
    final isDarkStored = prefs.getBool(_themeKey) ?? false;

    themeMode = isDarkStored ? ThemeMode.dark : ThemeMode.light;
  }
}
