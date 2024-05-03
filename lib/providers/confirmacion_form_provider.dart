import 'dart:async';

import 'package:app_comidas_semanales/models/base/base_model.dart';
import 'package:app_comidas_semanales/providers/base/base_form_provider.dart';

class ConfirmacionFormProvider extends BaseFormProvider<BaseModel> {
  late Timer timerMensajeOperacion;

  bool? _ventaOk;
  bool? get ventaOk => _ventaOk;
  set ventaOk(bool? value) {
    _ventaOk = value;
    notifyListeners();
  }

  setVentaOkWithoutListener(bool? value) {
    _ventaOk = value;
  }

  bool imprimiendo = false;
}
