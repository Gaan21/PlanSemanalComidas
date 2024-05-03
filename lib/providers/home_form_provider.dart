import 'package:app_comidas_semanales/providers/base/base_form_provider.dart';

class HomeFormProvider extends BaseFormProvider {
  String _password = "";
  String get password => _password;

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  bool _accesoConfiguracion = false;

  bool get accesoConfiguracion => _accesoConfiguracion;

  set accesoConfiguracion(bool value) {
    _accesoConfiguracion = value;
    notifyListeners();
  }
}
