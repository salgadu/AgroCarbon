// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeStore on ThemeStoreBase, Store {
  Computed<bool>? _$isDarkComputed;

  @override
  bool get isDark => (_$isDarkComputed ??=
          Computed<bool>(() => super.isDark, name: 'ThemeStoreBase.isDark'))
      .value;

  late final _$themeModeAtom =
      Atom(name: 'ThemeStoreBase.themeMode', context: context);

  @override
  ThemeMode get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeMode value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  late final _$toggleThemeAsyncAction =
      AsyncAction('ThemeStoreBase.toggleTheme', context: context);

  @override
  Future<void> toggleTheme() {
    return _$toggleThemeAsyncAction.run(() => super.toggleTheme());
  }

  late final _$_loadThemeAsyncAction =
      AsyncAction('ThemeStoreBase._loadTheme', context: context);

  @override
  Future<void> _loadTheme() {
    return _$_loadThemeAsyncAction.run(() => super._loadTheme());
  }

  @override
  String toString() {
    return '''
themeMode: ${themeMode},
isDark: ${isDark}
    ''';
  }
}
