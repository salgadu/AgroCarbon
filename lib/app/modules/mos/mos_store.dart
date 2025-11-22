import 'package:mobx/mobx.dart';

part 'mos_store.g.dart';

enum MosCalculationType { calculateMos, calculateCot }

class MosStore = MosStoreBase with _$MosStore;

abstract class MosStoreBase with Store {
  @observable
  String inputValue = '';

  @observable
  double? resultValue;

  @observable
  MosCalculationType calculationType = MosCalculationType.calculateMos;

  @computed
  bool get canCalculate => double.tryParse(inputValue) != null;

  @computed
  bool get isCotMode => calculationType == MosCalculationType.calculateCot;

  @action
  void setInputValue(String value) {
    inputValue = value;
    // Não limpamos mais o resultado automaticamente ao digitar
    // resultValue = null;
  }

  @action
  void setCalculationType(MosCalculationType type) {
    calculationType = type;
    clear(); // Usa o clear para limpar tudo
  }

  @action
  void calculate() {
    final value = double.tryParse(inputValue);
    if (value != null) {
      if (calculationType == MosCalculationType.calculateMos) {
        resultValue = value * 1.724;
      } else {
        resultValue = value * 0.58;
      }
    } else {
      resultValue = null;
    }
  }

  // --- NOVA AÇÃO CLEAR ---
  @action
  void clear() {
    inputValue = '';
    resultValue = null;
  }
}
