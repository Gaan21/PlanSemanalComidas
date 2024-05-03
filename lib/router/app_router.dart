import 'package:app_comidas_semanales/screens/lista_dias_screen.dart';
import 'package:app_comidas_semanales/screens/receta_list_screen.dart';

import 'package:app_comidas_semanales/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static String getInitialRoute() {
    return ListaDiasScreen.nombreRuta;
  }

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({
      ListaDiasScreen.nombreRuta: (BuildContext context) =>
          const ListaDiasScreen(),
      RecetaListScreen.nombreRuta: (BuildContext context) =>
          const RecetaListScreen(),
    });

    return appRoutes;
  }
}
