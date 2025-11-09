// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MosStore on MosStoreBase, Store {
  Computed<bool>? _$canCalculateComputed;

  @override
  bool get canCalculate => (_$canCalculateComputed ??= Computed<bool>(
    () => super.canCalculate,
    name: 'MosStoreBase.canCalculate',
  )).value;

  late final _$cotInputAtom = Atom(
    name: 'MosStoreBase.cotInput',
    context: context,
  );

  @override
  String get cotInput {
    _$cotInputAtom.reportRead();
    return super.cotInput;
  }

  @override
  set cotInput(String value) {
    _$cotInputAtom.reportWrite(value, super.cotInput, () {
      super.cotInput = value;
    });
  }

  late final _$mosResultAtom = Atom(
    name: 'MosStoreBase.mosResult',
    context: context,
  );

  @override
  double? get mosResult {
    _$mosResultAtom.reportRead();
    return super.mosResult;
  }

  @override
  set mosResult(double? value) {
    _$mosResultAtom.reportWrite(value, super.mosResult, () {
      super.mosResult = value;
    });
  }

  late final _$MosStoreBaseActionController = ActionController(
    name: 'MosStoreBase',
    context: context,
  );

  @override
  void setCot(String value) {
    final _$actionInfo = _$MosStoreBaseActionController.startAction(
      name: 'MosStoreBase.setCot',
    );
    try {
      return super.setCot(value);
    } finally {
      _$MosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateMos() {
    final _$actionInfo = _$MosStoreBaseActionController.startAction(
      name: 'MosStoreBase.calculateMos',
    );
    try {
      return super.calculateMos();
    } finally {
      _$MosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cotInput: ${cotInput},
mosResult: ${mosResult},
canCalculate: ${canCalculate}
    ''';
  }
}
