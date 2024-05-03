import 'package:app_comidas_semanales/helpers/helpers.dart';
import 'package:app_comidas_semanales/models/base/base_model.dart';
import 'package:app_comidas_semanales/providers/base/base_form_provider.dart';
import 'package:app_comidas_semanales/services/base/base_service.dart';
import 'package:app_comidas_semanales/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:search_page/search_page.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class BaseListScreen<T extends BaseService, P extends BaseFormProvider,
    D extends BaseModel> extends StatelessWidget {
  final bool visibleAppBar;
  final bool visibleFloatingActionButton;
  final bool enabledSlidableListaActions;
  final bool enabledOnTapSlidableLista;
  final bool enabledLoadArguments;
  final bool visibleBackButtonLeading;
  final bool visibleBottomNavigationBar;

  const BaseListScreen({
    super.key,
    this.visibleAppBar = true,
    this.visibleFloatingActionButton = true,
    this.enabledSlidableListaActions = true,
    this.enabledOnTapSlidableLista = true,
    this.enabledLoadArguments = true,
    this.visibleBackButtonLeading = true,
    this.visibleBottomNavigationBar = false,
  });

  @protected
  String getTitle();

  @protected
  String getRutaDetalle(BuildContext context);

  @protected
  String getRutaNuevoDetalle(BuildContext context) {
    return getRutaDetalle(context);
  }

  @protected
  Widget? bottomNavigationBar(BuildContext context, P formProvider, T service) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_outlined),
          label: 'Recetas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Plan semanal',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
      //currentIndex: _selectedIndex, // Debes definir esta variable
      //onTap: _onItemTapped, // Debes implementar esta función
    );
  }

  @protected
  Future<D> newEntity(P formProvider, T service);

  @protected
  Widget getDetalleLista(
      D entity, T service, BuildContext context, P formProvider);

  @protected
  T getService(BuildContext context) => GetIt.I<T>();

  @protected
  navigatorPushNamed(
      {required BuildContext context,
      required T service,
      required D? entity,
      required P formProvider}) async {
    if (entity != null) {
      final NavigatorState navigator = Navigator.of(context);
      String rutaNuevoDetalle = getRutaNuevoDetalle(context);
      String rutaDetalle = getRutaDetalle(context);

      try {
        await EasyLoading.show(status: 'cargando'.tr());
        entity = service.entityFromMap(service.entityToJson(entity)) as D;
      } finally {
        await EasyLoading.dismiss();
      }

      try {
        await EasyLoading.show(status: 'cargando'.tr());
        //TODO: if (!(await service.comprobarConexion())) {
        //   await EasyLoading.dismiss();
        //   if (context.mounted) {
        //     await QuickAlertWidget.show(
        //       formProvider: formProvider,
        //       context: context,
        //       type: QuickAlertType.error,
        //       confirmBtnText: 'ok'.tr(),
        //       title: 'error'.tr(),
        //       text: 'no_existe_conexion_internet'.tr(),
        //     );
        //   }
        //   return;
        // }
      } catch (e, s) {
        GlobalValues.loggerService?.exceptionTrace(e, s);
      } finally {
        await EasyLoading.dismiss();
      }

      if (context.mounted) {
        await navigator.pushNamed(
          entity.id == 0 ? rutaNuevoDetalle : rutaDetalle,
          arguments: await navigatorArguments(
              context: context,
              service: service,
              entity: entity,
              formProvider: formProvider),
        );
      }
    } else {
      throw Exception(
          'Error en el método "navigatorPushNamed", la entidad viene vacía');
    }
  }

  @protected
  Future<Object?> navigatorArguments({
    required BuildContext context,
    required T service,
    required D? entity,
    required P formProvider,
  }) async {
    return {
      ConstantesHelper.argumentEntity: entity,
    };
  }

  @protected
  List<String> arraySearch(D entity);

  @protected
  String getMessageHelp();

  @protected
  getbackgroundColor() {
    return null;
  }

  @protected
  loadArguments(BuildContext context, P formProvider, T service) {}

  @protected
  P getProvider(BuildContext context) {
    return Provider.of<P>(context, listen: true);
  }

  @override
  Widget build(BuildContext context) {
    P formProvider = getProvider(context);

    T service = getService(context);

    if (enabledLoadArguments) {
      loadArguments(context, formProvider, service);
    }

    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) async {
            if (didPop) {
              return;
            }
            if (!formProvider.disabledBackPressed) {
              Navigator.of(context).pop();
            }
          },
          child: Scaffold(
            backgroundColor: getbackgroundColor(),
            drawer: getDrawer(formProvider),
            appBar: visibleAppBar
                ? AppBar(
                    automaticallyImplyLeading: true,
                    leading: visibleBackButtonLeading
                        ? IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => Navigator.of(context).pop(),
                          )
                        : null,
                    title: Text(getTitle()),
                    actions: appBarActions(context, service, formProvider),
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.9),
                    foregroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                  )
                : null,
            body: appBody(service, formProvider, context),
            bottomNavigationBar: visibleBottomNavigationBar
                ? bottomNavigationBar(context, formProvider, service)
                : null,
            floatingActionButton: visibleFloatingActionButton
                ? FloatingActionButton(
                    heroTag: null,
                    child: formProvider.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Icon(Icons.add),
                    onPressed: () async {
                      final D entity = await newEntity(formProvider, service);
                      if (context.mounted) {
                        navigatorPushNamed(
                          context: context,
                          service: service,
                          entity: entity,
                          formProvider: formProvider,
                        );
                      }
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }

  @protected
  Future<List<D>> getRegisters(
      BuildContext context, T service, P formProvider) async {
    // if (!(await service.comprobarConexion())) {
    //   if (context.mounted) {
    //     await QuickAlertWidget.show(
    //       formProvider: formProvider,
    //       context: context,
    //       type: QuickAlertType.error,
    //       confirmBtnText: 'ok'.tr(),
    //       title: 'error'.tr(),
    //       text: 'no_existe_conexion_internet'.tr(),
    //     );
    //   }
    //   return [];
    // }

    return Future.value([]);
    //return service.getAll() as Future<List<D>>;
  }

  @protected
  Widget appBody(T service, P formProvider, BuildContext context) {
    return Column(
      children: [
        appBodyCabecera(service, formProvider, context),
        Expanded(
          child: appBodyLista(service, formProvider, context),
        ),
      ],
    );
  }

  @protected
  Widget appBodyCabecera(T service, P formProvider, BuildContext context) {
    return Container();
  }

  @protected
  Widget appBodyLista(T service, P formProvider, BuildContext context) {
    return FutureBuilder<List<D>>(
      future: getRegisters(context, service, formProvider),
      builder: (BuildContext context, AsyncSnapshot<List<D>> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else {
          formProvider.setEntitiesWithoutListener(snapshot.data as List<D>);

          return ListView.builder(
            //physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: formProvider.entities?.length,
            itemBuilder: (context, index) {
              D entity = formProvider.entities?[index] as D;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                margin: const EdgeInsets.only(top: 5, left: 0, right: 0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: slidableLista(context, service, entity, formProvider),
                ),
              );
            },
          );
        }
      },
    );
  }

  @protected
  List<Widget> appBarActions(BuildContext context, T service, P formProvider) {
    return [
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage(
            showItemsOnEmpty: true,
            onQueryUpdate: print,
            items: formProvider.entities as List<D>,
            searchLabel: 'buscar'.tr(),
            suggestion: Center(
              child: Text('empiece_escribir_busqueda'.tr()),
            ),
            failure: Center(
              child: Text('no_encontrado_nada'.tr()),
            ),
            filter: (entity) => arraySearch(entity),
            builder: (D entity) =>
                slidableLista(context, service, entity, formProvider),
          ),
        ),
      ),
      if (getMessageHelp().isNotEmpty)
        IconButton(
          icon: const Icon(Icons.live_help),
          onPressed: () async {
            return await QuickAlertWidget.show(
              formProvider: formProvider,
              context: context,
              type: QuickAlertType.info,
              title: 'ayuda'.tr(),
              text: getMessageHelp(),
              confirmBtnText: 'ok'.tr(),
              showCancelBtn: false,
            );
          },
        ),
      if (appBarActionsPopupMenuButton(context, service, formProvider) != null)
        appBarActionsPopupMenuButton(context, service, formProvider)!,
    ];
  }

  @protected
  PopupMenuButton? appBarActionsPopupMenuButton(
      BuildContext context, T service, P formProvider) {
    return null;
  }

  Slidable slidableLista(
      BuildContext context, T service, D entity, P formProvider) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: GlobalKey(),

      // The start action pane is the one at the left or the top side.
      startActionPane: !enabledSlidableListaActions
          ? null
          : ActionPane(
              // A motion is a widget used to control how the pane animates.
              motion: const ScrollMotion(),

              // A pane can dismiss the Slidable.
              dismissible: DismissiblePane(
                confirmDismiss: () async {
                  return await deleteDialog(context, formProvider);
                },
                closeOnCancel: true,
                onDismissed: () {
                  //TODO: if (entity.id != 0) {
                  //   service.delete(id: entity.id);
                  // }
                },
              ),
              // All actions are defined in the children parameter.
              children: [
                SlidableAction(
                  onPressed: (context) async {
                    if (await deleteDialog(context, formProvider)) {
                      //TODO: if (entity.id != 0) {
                      //   service.delete(id: entity.id);
                      // }
                    }
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'borrar'.tr(),
                ),
              ],
            ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: !enabledSlidableListaActions
          ? null
          : ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 2,
                  onPressed: (context) {
                    navigatorPushNamed(
                        context: context,
                        service: service,
                        entity: entity,
                        formProvider: formProvider);
                  },
                  backgroundColor: const Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'editar'.tr(),
                ),
              ],
            ),
      child: InkWell(
        onTap: !enabledOnTapSlidableLista
            ? null
            : () async {
                await navigatorPushNamed(
                    context: context,
                    service: service,
                    entity: entity,
                    formProvider: formProvider);
              },
        child: Ink(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: getDetalleLista(entity, service, context, formProvider),
          ),
        ),
      ),
    );
  }

  @protected
  Widget? getDrawer(P formProvider) => null;

  Future<dynamic> deleteDialog(
      BuildContext context, BaseFormProvider formProvider) async {
    NavigatorState navigator = Navigator.of(context, rootNavigator: true);
    return await QuickAlertWidget.show(
      formProvider: formProvider,
      context: context,
      type: QuickAlertType.confirm,
      title: 'eliminacion'.tr(),
      barrierDismissible: false,
      text: 'esta_seguro_borrar'.tr(),
      confirmBtnText: 'si'.tr(),
      cancelBtnText: 'no'.tr(),
      onConfirmBtnTap: () => navigator.pop(true),
      onCancelBtnTap: () => navigator.pop(false),
    );
  }
}
