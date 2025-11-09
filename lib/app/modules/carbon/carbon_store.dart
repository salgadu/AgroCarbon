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
  double? estcResult;

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
      estcResult = (co * ds * e) / 10;
    } else {
      estcResult = null;
    }
  }
}
