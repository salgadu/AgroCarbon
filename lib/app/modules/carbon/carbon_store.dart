import 'package:mobx/mobx.dart';

part 'carbon_store.g.dart';

class CarbonStore = CarbonStoreBase with _$CarbonStore;

abstract class CarbonStoreBase with Store {
  @observable
  String coInput = '';

  @observable
  String dsInput = '';

  @observable
  String eInput = '';

  @observable
  double? resultKgM2; // Renomeado de resultMgHa para refletir a nova unidade

  @computed
  bool get canCalculate =>
      double.tryParse(coInput) != null &&
      double.tryParse(dsInput) != null &&
      double.tryParse(eInput) != null;

  @action
  void calculateEstc() {
    final co = double.tryParse(coInput);
    final ds = double.tryParse(dsInput);
    final e = double.tryParse(eInput);

    if (co != null && ds != null && e != null) {
      // Fórmula atualizada: (CO × Ds × e) / 10
      resultKgM2 = (co * ds * e) / 10;
    } else {
      resultKgM2 = null;
    }
  }

  @action
  void clear() {
    coInput = '';
    dsInput = '';
    eInput = '';
    resultKgM2 = null;
  }
}
