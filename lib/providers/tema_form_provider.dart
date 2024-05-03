import 'package:app_comidas_semanales/helpers/helpers.dart';
import 'package:app_comidas_semanales/models/base/base_model.dart';
import 'package:app_comidas_semanales/models/enum/enum.dart';
import 'package:app_comidas_semanales/providers/base/base_form_provider.dart';
import 'package:app_comidas_semanales/themes/theme.dart';
import 'package:flutter/material.dart';

class TemaFormProvider extends BaseFormProvider<BaseModel> {
  IconData icono = Icons.wb_sunny;

  TemaEnum _temaEnum = TemaEnum.claro;
  TemaEnum get temaEnum => _temaEnum;
  set temaEnum(TemaEnum value) {
    if (value != _temaEnum) {
      _temaEnum = value;
      notifyListeners();
    }
  }

  void cambiarTema(TemaEnum value, AppComidasSemanalesTheme chiquiparkTheme) {
    temaEnum = value;

    if (_temaEnum == TemaEnum.claro) {
      icono = Icons.wb_sunny;
      chiquiparkTheme.currentTheme = AppComidasSemanalesTheme.lightTheme;
    } else {
      icono = Icons.brightness_2_outlined;
      chiquiparkTheme.currentTheme = AppComidasSemanalesTheme.darkTheme;
    }
  }

  void cambiarTemaWithoutListener(
      TemaEnum value, AppComidasSemanalesTheme chiquiparkTheme) {
    _temaEnum = value;

    if (_temaEnum == TemaEnum.claro) {
      icono = Icons.wb_sunny;
      chiquiparkTheme.currentTheme = AppComidasSemanalesTheme.lightTheme;
    } else {
      icono = Icons.brightness_2_outlined;
      chiquiparkTheme.currentTheme = AppComidasSemanalesTheme.darkTheme;
    }
  }

  void setTemaPorDefecto(AppComidasSemanalesTheme chiquiparkTheme) {
    try {
      cambiarTema(
          GlobalValues.modoTemaPorDefecto == TemaEnum.oscuro
              ? TemaEnum.oscuro
              : TemaEnum.claro,
          chiquiparkTheme);
    } catch (e, s) {
      GlobalValues.loggerService?.exceptionTrace(e, s);
    }
  }

  void setTemaPorDefectoWithoutListener(
      AppComidasSemanalesTheme chiquiparkTheme) {
    try {
      cambiarTemaWithoutListener(
          GlobalValues.modoTemaPorDefecto == TemaEnum.oscuro
              ? TemaEnum.oscuro
              : TemaEnum.claro,
          chiquiparkTheme);
    } catch (e, s) {
      GlobalValues.loggerService?.exceptionTrace(e, s);
    }
  }
}
