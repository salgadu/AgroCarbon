import 'package:mobx/mobx.dart';

part 'mos_store.g.dart';

class MosStore = MosStoreBase with _$MosStore;

abstract class MosStoreBase with Store {
  @observable
  String cotInput = '';
  @observable
  double? mosResult;

  @computed
  bool get canCalculate => double.tryParse(cotInput) != null;

  @action
  void setCot(String value) {
    cotInput = value;
    mosResult = null;
  }

  @action
  void calculateMos() {
    final cotValue = double.tryParse(cotInput);
    if (cotValue != null) {
      // Fórmula: MOS (%) = COT (%) * 1,724
      mosResult = cotValue * 1.724;
    } else {
      mosResult = null;
    }
  }
}
