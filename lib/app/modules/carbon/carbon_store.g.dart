// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carbon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarbonStore on CarbonStoreBase, Store {
  Computed<bool>? _$canCalculateComputed;

  @override
  bool get canCalculate =>
      (_$canCalculateComputed ??= Computed<bool>(() => super.canCalculate,
              name: 'CarbonStoreBase.canCalculate'))
          .value;

  late final _$coInputAtom =
      Atom(name: 'CarbonStoreBase.coInput', context: context);

  @override
  String get coInput {
    _$coInputAtom.reportRead();
    return super.coInput;
  }

  @override
  set coInput(String value) {
    _$coInputAtom.reportWrite(value, super.coInput, () {
      super.coInput = value;
    });
  }

  late final _$dsInputAtom =
      Atom(name: 'CarbonStoreBase.dsInput', context: context);

  @override
  String get dsInput {
    _$dsInputAtom.reportRead();
    return super.dsInput;
  }

  @override
  set dsInput(String value) {
    _$dsInputAtom.reportWrite(value, super.dsInput, () {
      super.dsInput = value;
    });
  }

  late final _$eInputAtom =
      Atom(name: 'CarbonStoreBase.eInput', context: context);

  @override
  String get eInput {
    _$eInputAtom.reportRead();
    return super.eInput;
  }

  @override
  set eInput(String value) {
    _$eInputAtom.reportWrite(value, super.eInput, () {
      super.eInput = value;
    });
  }

  late final _$resultKgM2Atom =
      Atom(name: 'CarbonStoreBase.resultKgM2', context: context);

  @override
  double? get resultKgM2 {
    _$resultKgM2Atom.reportRead();
    return super.resultKgM2;
  }

  @override
  set resultKgM2(double? value) {
    _$resultKgM2Atom.reportWrite(value, super.resultKgM2, () {
      super.resultKgM2 = value;
    });
  }

  late final _$CarbonStoreBaseActionController =
      ActionController(name: 'CarbonStoreBase', context: context);

  @override
  void calculateEstc() {
    final _$actionInfo = _$CarbonStoreBaseActionController.startAction(
        name: 'CarbonStoreBase.calculateEstc');
    try {
      return super.calculateEstc();
    } finally {
      _$CarbonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$CarbonStoreBaseActionController.startAction(
        name: 'CarbonStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$CarbonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
coInput: ${coInput},
dsInput: ${dsInput},
eInput: ${eInput},
resultKgM2: ${resultKgM2},
canCalculate: ${canCalculate}
    ''';
  }
}
