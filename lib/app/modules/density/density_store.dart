import 'dart:math' as math;
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

  @observable
  double? volumeResult;

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

    if (r != null && h != null && m != null) {
      final volume = math.pi * math.pow(r, 2) * h;
      final density = m / volume;
      volumeResult = volume;
      densityResult = density;
    } else {
      volumeResult = null;
      densityResult = null;
    }
  }

  // --- NOVA AÇÃO CLEAR ---
  @action
  void clear() {
    radiusInput = '';
    heightInput = '';
    massInput = '';
    densityResult = null;
    volumeResult = null;
  }
}
