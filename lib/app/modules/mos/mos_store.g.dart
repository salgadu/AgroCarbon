// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MosStore on MosStoreBase, Store {
  Computed<bool>? _$canCalculateComputed;

  @override
  bool get canCalculate =>
      (_$canCalculateComputed ??= Computed<bool>(() => super.canCalculate,
              name: 'MosStoreBase.canCalculate'))
          .value;
  Computed<bool>? _$isCotModeComputed;

  @override
  bool get isCotMode => (_$isCotModeComputed ??=
          Computed<bool>(() => super.isCotMode, name: 'MosStoreBase.isCotMode'))
      .value;

  late final _$inputValueAtom =
      Atom(name: 'MosStoreBase.inputValue', context: context);

  @override
  String get inputValue {
    _$inputValueAtom.reportRead();
    return super.inputValue;
  }

  @override
  set inputValue(String value) {
    _$inputValueAtom.reportWrite(value, super.inputValue, () {
      super.inputValue = value;
    });
  }

  late final _$resultValueAtom =
      Atom(name: 'MosStoreBase.resultValue', context: context);

  @override
  double? get resultValue {
    _$resultValueAtom.reportRead();
    return super.resultValue;
  }

  @override
  set resultValue(double? value) {
    _$resultValueAtom.reportWrite(value, super.resultValue, () {
      super.resultValue = value;
    });
  }

  late final _$calculationTypeAtom =
      Atom(name: 'MosStoreBase.calculationType', context: context);

  @override
  MosCalculationType get calculationType {
    _$calculationTypeAtom.reportRead();
    return super.calculationType;
  }

  @override
  set calculationType(MosCalculationType value) {
    _$calculationTypeAtom.reportWrite(value, super.calculationType, () {
      super.calculationType = value;
    });
  }

  late final _$MosStoreBaseActionController =
      ActionController(name: 'MosStoreBase', context: context);

  @override
  void setInputValue(String value) {
    final _$actionInfo = _$MosStoreBaseActionController.startAction(
        name: 'MosStoreBase.setInputValue');
    try {
      return super.setInputValue(value);
    } finally {
      _$MosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCalculationType(MosCalculationType type) {
    final _$actionInfo = _$MosStoreBaseActionController.startAction(
        name: 'MosStoreBase.setCalculationType');
    try {
      return super.setCalculationType(type);
    } finally {
      _$MosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculate() {
    final _$actionInfo = _$MosStoreBaseActionController.startAction(
        name: 'MosStoreBase.calculate');
    try {
      return super.calculate();
    } finally {
      _$MosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo =
        _$MosStoreBaseActionController.startAction(name: 'MosStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$MosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
inputValue: ${inputValue},
resultValue: ${resultValue},
calculationType: ${calculationType},
canCalculate: ${canCalculate},
isCotMode: ${isCotMode}
    ''';
  }
}
