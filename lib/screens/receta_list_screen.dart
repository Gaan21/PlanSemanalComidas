import 'package:app_comidas_semanales/models/base/base_model.dart';
import 'package:app_comidas_semanales/models/models.dart';
import 'package:app_comidas_semanales/models/receta_model.dart';
import 'package:app_comidas_semanales/providers/providers.dart';
import 'package:app_comidas_semanales/screens/base/base_list_screen.dart';
import 'package:app_comidas_semanales/screens/screens.dart';
import 'package:app_comidas_semanales/services/base/base_service.dart';
import 'package:app_comidas_semanales/services/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RecetaListScreen
    extends BaseListScreen<RecetaService, RecetaProvider, RecetaModel> {
  static String nombreRuta = 'RecetaListScreen';

  const RecetaListScreen({super.key})
      : super(
            enabledSlidableListaActions: false,
            enabledLoadArguments: false,
            enabledOnTapSlidableLista: true,
            visibleAppBar: true,
            visibleBackButtonLeading: true,
            visibleFloatingActionButton: true,
            visibleBottomNavigationBar: true);

  @override
  List<String> arraySearch(RecetaModel entity) {
    return [entity.categoria ?? "", entity.descripcion ?? ""];
  }

  //TODO: Guardar en BBDD con hive

  @override
  Future<List<RecetaModel>> getRegisters(BuildContext context,
      RecetaService service, RecetaProvider formProvider) {
    // TODO: implement getRegisters
    return Future.value([
      RecetaModel(
        id: 1,
        ingredientes: ["0", "1"],
        nombre: "Cook Something New Everyday",
        descripcion: "New and tasty recipes every minute",
      ),
      RecetaModel(
        id: 2,
        ingredientes: ["0", "1"],

        nombre: "Best of 2020",
        descripcion: "Cook recipes for special occasions",
        // imageSrc: "assets/images/best_2020@2x.png",
        // color: Color(0xFF90AF17),
      ),
      RecetaModel(
        id: 3,
        ingredientes: ["0", "1"],
        nombre: "Food Court",
        descripcion: "What's your favorite food dish make it now",
      ),
    ]);
  }

  @override
  Widget getDetalleLista(RecetaModel entity, RecetaService service,
      BuildContext context, RecetaProvider formProvider) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entity.descripcion ?? "",
                    style: const TextStyle(
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (entity.ingredientes != null || entity.categoria != null)
                    Text(
                      '${'registro_persona_list_screen.responsable'.tr()}: ${entity.ingredientes ?? ''} ${entity.categoria ?? ''}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  Text(
                    entity.tiempoPreparacion.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  String getMessageHelp() => '';

  @override
  String getRutaDetalle(BuildContext context) => RecetaListScreen.nombreRuta;

  @override
  String getTitle() => 'registro_persona_list_screen.lista_ninios'.tr();

  @override
  Future<RecetaModel> newEntity(
      RecetaProvider formProvider, RecetaService service) async {
    return RecetaModel(descripcion: "");
  }
}
