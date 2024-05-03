import 'package:app_comidas_semanales/helpers/helpers.dart';
import 'package:app_comidas_semanales/providers/base/base_form_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class IdiomaFormProvider extends BaseFormProvider {
  Locale _idioma = GlobalValues.idiomas.entries.first.value;
  Locale get idioma => _idioma;
  set idioma(Locale value) {
    _idioma = value;
    notifyListeners();
  }

  setIdiomaWithoutListener(Locale value) {
    _idioma = value;
  }

  Future setIdioma(BuildContext context, int idiomaKey) async {
    Locale locale = GlobalValues.idiomas.entries
        .firstWhere((element) => element.key == idiomaKey)
        .value;

    await context.setLocale(locale);
    if (locale.languageCode != idioma.languageCode) {
      idioma = locale;
    }
  }

  void setIdiomaPorDefecto(BuildContext context) {
    try {
      if (GlobalValues.idiomaPorDefecto != null) {
        setIdioma(
            context,
            GlobalValues.idiomaPorDefecto ??
                GlobalValues.idiomas.entries.first.key);
      }
    } catch (e, s) {
      GlobalValues.loggerService?.exceptionTrace(e, s);
      idioma = GlobalValues.idiomas.entries.first.value;
    }
  }
}
