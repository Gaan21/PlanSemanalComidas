import 'package:app_comidas_semanales/models/enum/enum.dart';
import 'package:flutter/material.dart';

class AppComidasSemanalesTheme {
  static const Color colorAzul = Color(0xff00adff);
  static const Color colorGris = Color(0xffaeaeae);
  static const Color colorFondoScaffoldOscuro = Color(0xff000000);
  static const Color colorFondoAppBarOscuro = Color(0xff1c1c1c);

  static const Color colorFondoScaffoldClaro = Color(0xfff2f2f2);
  static const Color colorFondoAppBarClaro = Color(0xffffffff);

  ThemeData currentTheme = lightTheme;

  set setTheme(TemaEnum theme) {
    switch (theme) {
      case TemaEnum.oscuro:
        currentTheme = lightTheme;
        break;
      case TemaEnum.claro:
      default:
        currentTheme = darkTheme;
        break;
    }
  }

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: colorFondoScaffoldClaro,
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
          backgroundColor: colorFondoAppBarClaro,
          elevation: 1,
        ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: colorFondoScaffoldClaro,
      error: Colors.red,
    ),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: colorAzul,
          displayColor: colorAzul,
        ),
    iconTheme: ThemeData.light().iconTheme.copyWith(
          color: colorAzul,
        ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: colorFondoScaffoldOscuro,
    appBarTheme: ThemeData.dark().appBarTheme.copyWith(
          backgroundColor: colorFondoAppBarOscuro,
          elevation: 1,
        ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: colorFondoScaffoldOscuro,
      error: Colors.red,
    ),
    textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
  );
}
