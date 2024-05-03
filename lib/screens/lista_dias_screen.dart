import 'dart:math';

import 'package:app_comidas_semanales/models/base/base_model.dart';
import 'package:app_comidas_semanales/providers/base/base_form_provider.dart';
import 'package:app_comidas_semanales/providers/providers.dart';
import 'package:app_comidas_semanales/screens/base/base_screen.dart';
import 'package:app_comidas_semanales/screens/receta_list_screen.dart';
import 'package:app_comidas_semanales/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaDiasScreen
    extends BaseScreen<ListaDiasService, ListaDiasProvider, BaseModel> {
  static String nombreRuta = 'ListaDiasScreen';

  const ListaDiasScreen({super.key})
      : super(
            enabledLoadArguments: false,
            visibleAppBar: true,
            visibleBackButtonLeading: false,
            enabledDelete: false,
            visibleBottomNavigationBar: true,
            visibleFloatingButton: true);

  @override
  String getMessageHelp() => '';

  @override
  Widget? getFloatingActionButton(
      {required BuildContext context,
      required ListaDiasService service,
      required ListaDiasProvider formProvider,
      Icon? icono}) {
    return super.getFloatingActionButton(
        context: context,
        service: service,
        formProvider: formProvider,
        icono: const Icon(Icons.abc));
  }

  @override
  Widget getBody(
      {required BuildContext context,
      required ListaDiasProvider formProvider,
      required ListaDiasService service}) {
    service.mezclarComidasCenas();
    return ListView.builder(
      itemCount: service.diasDeLaSemana.length,
      itemBuilder: (context, index) {
        String comidaDelDia = index < service.comidas.length
            ? service.comidas[index]
            : service.comidas[Random().nextInt(service.comidas.length)];

        String cenaDelDia = index < service.cenas.length
            ? service.cenas[index]
            : service.cenas[Random().nextInt(service.cenas.length)];

        return Card(
          child: ListTile(
            onTap: () {
              navegarScreen(
                  context: context,
                  nombreRuta: RecetaListScreen.nombreRuta,
                  formProvider: formProvider,
                  service: service);
            },
            title: Text(
              service.diasDeLaSemana[index],
              style: const TextStyle(fontSize: 25),
            ),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Text(
                      comidaDelDia,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      cenaDelDia,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  String getTitle(ListaDiasProvider formProvider) {
    return "Menú semanal";
  }
}
