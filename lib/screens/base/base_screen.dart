import 'package:app_comidas_semanales/helpers/helpers.dart';
import 'package:app_comidas_semanales/models/base/base_model.dart';
import 'package:app_comidas_semanales/models/enum/enum.dart';
import 'package:app_comidas_semanales/providers/base/base_form_provider.dart';
import 'package:app_comidas_semanales/providers/providers.dart';
import 'package:app_comidas_semanales/screens/receta_list_screen.dart';
import 'package:app_comidas_semanales/screens/screens.dart';
import 'package:app_comidas_semanales/services/base/base_service.dart';
import 'package:app_comidas_semanales/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

final GetIt getIt = GetIt.instance;

abstract class BaseScreen<T extends BaseService, P extends BaseFormProvider,
    D extends BaseModel> extends StatelessWidget {
  final bool visibleAppBar;
  final bool visibleFloatingButton;
  final bool enabledLoadArguments;
  final bool enabledDelete;
  final bool visibleBackButtonLeading;
  final bool visibleBottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const BaseScreen({
    super.key,
    this.visibleAppBar = true,
    this.visibleFloatingButton = true,
    this.enabledLoadArguments = true,
    this.enabledDelete = true,
    this.visibleBackButtonLeading = true,
    this.visibleBottomNavigationBar = false,
    this.floatingActionButtonLocation,
  });

  @protected
  T getService(BuildContext context) => getIt<T>();

  @protected
  P getFormProvider(BuildContext context) =>
      Provider.of<P>(context, listen: false);

  @protected
  String getTitle(P formProvider);

  @protected
  Widget getBody(
      {required BuildContext context,
      required P formProvider,
      required T service});

  @protected
  AppBar? getAppBar(BuildContext context, T service, P formProvider) {
    return visibleAppBar
        ? AppBar(
            automaticallyImplyLeading: true,
            leading: visibleBackButtonLeading
                ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                : null,
            title: Text(
              getTitle(formProvider),
            ),
            actions: appBarActions(context, service, formProvider),
            backgroundColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.9),
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          )
        : null;
  }

  @protected
  Widget? getFloatingActionButton(
      {required BuildContext context,
      required T service,
      required P formProvider,
      final Icon? icono}) {
    return Selector<P, bool>(
      selector: (_, provider) => formProvider.isLoading,
      builder: (context, isLoading, child) {
        return FloatingActionButton(
          heroTag: null,
          child: isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : icono ?? const Icon(Icons.save),
          onPressed: () => isLoading
              ? null
              : onPressedFloatingActionButton(
                  context: context,
                  formProvider: formProvider,
                  service: service,
                ),
        );
      },
    );
  }

  @protected
  Future postGuardarAsync({
    required BuildContext context,
    required P formProvider,
    required T service,
  }) async {}

  @protected
  Future onPressedFloatingActionButton(
      {required BuildContext context,
      required P formProvider,
      required T service,
      bool refreshEntities = true}) async {
    try {
      formProvider.isLoading = true;

      if (formProvider.hasChangedEntity()) {
        if (!formProvider.isValidForm()) {
          await QuickAlertWidget.show(
            formProvider: formProvider,
            context: context,
            type: QuickAlertType.error,
            confirmBtnText: 'ok'.tr(),
            title: 'validacion'.tr(),
            text: 'existen_campos_sin_rellenar'.tr(),
          );
          return;
        }

        if (context.mounted &&
            !await guardarEntidadAsync(
              context: context,
              formProvider: formProvider,
              service: service,
            )) {
          if (context.mounted) {
            await QuickAlertWidget.show(
              formProvider: formProvider,
              context: context,
              type: QuickAlertType.error,
              confirmBtnText: 'ok'.tr(),
              title: 'guardado'.tr(),
              text: 'error_guardar'.tr(),
            );
          }
        } else {
          if (context.mounted) {
            await postGuardarAsync(
                context: context, formProvider: formProvider, service: service);
          }
        }

        if (refreshEntities) {
          if (context.mounted) {
            refreshEntitiesPostSave(
              context: context,
              formProvider: formProvider,
              service: service,
            );
          }
        }
      }
    } finally {
      formProvider.isLoading = false;
    }
    if (context.mounted) {
      await navegacionGuardar(
          context: context, formProvider: formProvider, service: service);
    }
  }

  @protected
  Future<void> navegacionGuardar(
      {required BuildContext context,
      required P formProvider,
      required T service}) {
    Navigator.of(context).pop();
    return Future.value();
  }

  @protected
  Future<bool> guardarEntidadAsync(
      {required BuildContext context,
      required P formProvider,
      required T service}) async {
    //TODO: return await service.save(
    //       entity: formProvider.entity,
    //     ) >
    //     0;
    return true;
  }

  @protected
  void refreshEntitiesPostSave(
      {required BuildContext context,
      required P formProvider,
      required T service}) {
    formProvider.entities?.clear();
  }

  @protected
  loadArguments(BuildContext context, P formProvider, T service) {
    if (ModalRoute.of(context)?.settings.arguments is Map<String, Object?>) {
      Map<String, Object?> arguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, Object?>;

      if (arguments.entries
          .any((element) => element.key == ConstantesHelper.argumentEntity)) {
        formProvider.setEntityWithoutListener((arguments.entries
            .firstWhere(
                (element) => element.key == ConstantesHelper.argumentEntity)
            .value as D?));
      }
    }
  }

  @protected
  getBuildWidget({
    required BuildContext context,
    required P formProvider,
    required T service,
  }) {
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
            appBar: getAppBar(context, service, formProvider),
            drawer: getDrawer(formProvider),
            bottomNavigationBar: visibleBottomNavigationBar
                ? bottomNavigationBar(context, formProvider, service)
                : null,
            body: getBody(
                context: context, formProvider: formProvider, service: service),
            floatingActionButtonLocation: floatingActionButtonLocation,
            floatingActionButton: visibleFloatingButton
                ? getFloatingActionButton(
                    context: context,
                    formProvider: formProvider,
                    service: service,
                  )
                : null,
          ),
        ),
      ),
    );
  }

  @protected
  getbackgroundColor() {
    return null;
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
  List<Widget> appBarActions(BuildContext context, T service, P formProvider) {
    return [
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
      if (appBarActionsPopupMenuButton(
              context: context, service: service, formProvider: formProvider) !=
          null)
        appBarActionsPopupMenuButton(
            context: context, service: service, formProvider: formProvider)!,
    ];
  }

  @protected
  PopupMenuButton? appBarActionsPopupMenuButton({
    required BuildContext context,
    required T service,
    required P formProvider,
    bool refreshEntities = true,
  }) {
    return enabledDelete && formProvider.entity?.id != 0
        ? PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: Text('eliminar'.tr()),
                  ),
                ),
              ];
            },
            onSelected: (value) async {
              if (value == 0) {
                if (await deleteDialog(context, formProvider)) {
                  try {
                    await EasyLoading.show(status: 'cargando'.tr());
                    formProvider.isLoading = true;
                    if (context.mounted) {
                      await deleteItem(context, service, formProvider);
                    }

                    formProvider.isLoading = false;
                    if (refreshEntities) {
                      if (context.mounted) {
                        refreshEntitiesPostSave(
                          context: context,
                          formProvider: formProvider,
                          service: service,
                        );
                      }
                    }

                    if (context.mounted) {
                      Navigator.of(context).pop(true);
                    }
                  } finally {
                    await EasyLoading.dismiss();
                  }
                }
              }
            },
          )
        : null;
  }

  @protected
  Future deleteItem(BuildContext context, T service, P formProvider) async {
    //TODO: if (!(await service.comprobarConexion())) {
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
    //await service.delete(id: formProvider.entity?.id ?? 0);
    return true;
  }

  @protected
  String getMessageHelp() {
    return '';
  }

  @protected
  Widget? getDrawer(P formProvider) => null;

  Future<bool> deleteDialog(
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

  @override
  Widget build(BuildContext context) {
    final P formProvider = getFormProvider(context);
    final T service = getService(context);

    if (enabledLoadArguments) {
      loadArguments(context, formProvider, service);
    }

    return getBuildWidget(
      context: context,
      formProvider: formProvider,
      service: service,
    );
  }

  @protected
  Future<void> navegarScreen({
    required BuildContext context,
    required String nombreRuta,
    required P formProvider,
    required T service,
    Object? arguments,
  }) async {
    try {
      GlobalValues.loggerService?.info('Navegando a la pantalla: $nombreRuta.');

      try {
        await EasyLoading.show(status: 'cargando'.tr());
        //TODO: if (!(await service.comprobarConexion())) {
        //   if (context.mounted) {
        //     await EasyLoading.dismiss();
        //     if (context.mounted) {
        //       await QuickAlertWidget.show(
        //         formProvider: formProvider,
        //         context: context,
        //         type: QuickAlertType.error,
        //         confirmBtnText: 'ok'.tr(),
        //         title: 'error'.tr(),
        //         text: 'no_existe_conexion_internet'.tr(),
        //       );
        //     }
        //   }
        //   return;
        // }
      } catch (e, s) {
        GlobalValues.loggerService?.exceptionTrace(e, s);
      } finally {
        await EasyLoading.dismiss();
      }

      if (context.mounted) {
        await Navigator.of(context).pushNamed(nombreRuta, arguments: arguments);
      }
    } catch (e, s) {
      GlobalValues.loggerService?.exceptionTrace(e, s);
      if (context.mounted) {
        await QuickAlertWidget.show(
          formProvider: formProvider,
          context: context,
          type: QuickAlertType.error,
          confirmBtnText: 'ok'.tr(),
          title: 'error'.tr(),
          text: 'error_no_controlado'.tr(),
        );
      }
    }
  }
}
