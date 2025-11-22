// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'density_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DensityStore on DensityStoreBase, Store {
  Computed<bool>? _$canCalculateComputed;

  @override
  bool get canCalculate =>
      (_$canCalculateComputed ??= Computed<bool>(() => super.canCalculate,
              name: 'DensityStoreBase.canCalculate'))
          .value;

  late final _$radiusInputAtom =
      Atom(name: 'DensityStoreBase.radiusInput', context: context);

  @override
  String get radiusInput {
    _$radiusInputAtom.reportRead();
    return super.radiusInput;
  }

  @override
  set radiusInput(String value) {
    _$radiusInputAtom.reportWrite(value, super.radiusInput, () {
      super.radiusInput = value;
    });
  }

  late final _$heightInputAtom =
      Atom(name: 'DensityStoreBase.heightInput', context: context);

  @override
  String get heightInput {
    _$heightInputAtom.reportRead();
    return super.heightInput;
  }

  @override
  set heightInput(String value) {
    _$heightInputAtom.reportWrite(value, super.heightInput, () {
      super.heightInput = value;
    });
  }

  late final _$massInputAtom =
      Atom(name: 'DensityStoreBase.massInput', context: context);

  @override
  String get massInput {
    _$massInputAtom.reportRead();
    return super.massInput;
  }

  @override
  set massInput(String value) {
    _$massInputAtom.reportWrite(value, super.massInput, () {
      super.massInput = value;
    });
  }

  late final _$densityResultAtom =
      Atom(name: 'DensityStoreBase.densityResult', context: context);

  @override
  double? get densityResult {
    _$densityResultAtom.reportRead();
    return super.densityResult;
  }

  @override
  set densityResult(double? value) {
    _$densityResultAtom.reportWrite(value, super.densityResult, () {
      super.densityResult = value;
    });
  }

  late final _$volumeResultAtom =
      Atom(name: 'DensityStoreBase.volumeResult', context: context);

  @override
  double? get volumeResult {
    _$volumeResultAtom.reportRead();
    return super.volumeResult;
  }

  @override
  set volumeResult(double? value) {
    _$volumeResultAtom.reportWrite(value, super.volumeResult, () {
      super.volumeResult = value;
    });
  }

  late final _$DensityStoreBaseActionController =
      ActionController(name: 'DensityStoreBase', context: context);

  @override
  void calculateDensity() {
    final _$actionInfo = _$DensityStoreBaseActionController.startAction(
        name: 'DensityStoreBase.calculateDensity');
    try {
      return super.calculateDensity();
    } finally {
      _$DensityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$DensityStoreBaseActionController.startAction(
        name: 'DensityStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$DensityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
radiusInput: ${radiusInput},
heightInput: ${heightInput},
massInput: ${massInput},
densityResult: ${densityResult},
volumeResult: ${volumeResult},
canCalculate: ${canCalculate}
    ''';
  }
}
