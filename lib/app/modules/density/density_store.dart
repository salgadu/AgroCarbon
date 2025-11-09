import 'dart:math';

import 'package:mobx/mobx.dart';

part 'density_store.g.dart';

class DensityStore = DensityStoreBase with _$DensityStore;

abstract class DensityStoreBase with Store {
  @observable
  String radiusInput = '';

  @observable
  String heightInput = '';

  @observable
  String massInput = '';

  @observable
  double? densityResult;

  @computed
  bool get canCalculate =>
      double.tryParse(radiusInput) != null &&
      double.tryParse(heightInput) != null &&
      double.tryParse(massInput) != null;

  @action
  void calculateDensity() {
    final r = double.tryParse(radiusInput);
    final h = double.tryParse(heightInput);
    final m = double.tryParse(massInput);

    if (r != null && h != null && m != null && r > 0 && h > 0) {
      // V = Π * R² * h
      final double volume = pi * (r * r) * h;

      // Densidade = M / V
      densityResult = m / volume;
    } else {
      densityResult = null;
    }
  }
}
