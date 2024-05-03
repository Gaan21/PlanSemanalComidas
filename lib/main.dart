import 'dart:async';
import 'package:app_comidas_semanales/helpers/helpers.dart';
import 'package:app_comidas_semanales/providers/providers.dart';
import 'package:app_comidas_semanales/services/services.dart';
import 'package:cron/cron.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'router/router.dart';

Future<void> main() async {
  GlobalValues.sesionUuid = const Uuid().v1().toString();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();

  registerServicesGetIt();

  GlobalValues.loggerService?.info('Se acaba de arrancar la aplicación');

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en'),
      Locale('es'),
    ],
    useOnlyLangCode: true,
    path: 'assets/i18n',
    fallbackLocale: const Locale('es'),
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavegacionBarProvider()),
        ChangeNotifierProvider(create: (_) => HomeFormProvider()),
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(create: (_) => IdiomaFormProvider()),
        ChangeNotifierProvider(create: (_) => NavegacionBarProvider()),
        ChangeNotifierProvider(create: (_) => TemaFormProvider()),
        ChangeNotifierProvider(create: (_) => ConfirmacionFormProvider()),
        ChangeNotifierProvider(create: (_) => PagoCanceladoFormProvider()),
        ChangeNotifierProvider(create: (_) => RecetaProvider()),
        ChangeNotifierProvider(create: (_) => ListaDiasProvider()),
      ],
      child: const MyApp(),
    ),
  ));
}

void registerServicesGetIt() {
  GetIt.I.registerSingleton<HiveService>(HiveService(), signalsReady: true);
  GetIt.I.registerSingleton<HomeService>(HomeService(), signalsReady: true);
  GetIt.I.registerSingleton<ListaDiasService>(ListaDiasService(),
      signalsReady: true);
  GetIt.I.registerSingleton<RecetaService>(RecetaService(), signalsReady: true);
}

Future obtenerEstadoConexion() async {
  try {
    // GlobalValues.existeConexion =
    //     await Utils.existeConexionInternet(conexionServicios: false);
    GlobalValues.loggerService?.info(
        'El estado de conexión a internet es: ${GlobalValues.existeConexion}');
  } catch (e, s) {
    GlobalValues.loggerService?.exceptionTrace(e, s);
  }

  bool comprobandoConexion = false;

  GlobalValues.cron.schedule(Schedule.parse('*/30 * * * * *'), () async {
    try {
      if (!comprobandoConexion) {
        try {
          comprobandoConexion = true;
          // GlobalValues.existeConexion =
          //     await Utils.existeConexionInternet(conexionServicios: false);
          // GlobalValues.loggerService?.info(
          //     'El estado de conexión a internet es: ${GlobalValues.existeConexion}');
        } finally {
          comprobandoConexion = false;
        }
      }
    } catch (e, s) {
      GlobalValues.loggerService?.exceptionTrace(e, s);
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'ComidasSemanales',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRouter.getInitialRoute(),
      routes: AppRouter.getAppRoutes(),
      builder: EasyLoading.init(),
    );
  }

  void configLoading(BuildContext context) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 8000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorColor = Theme.of(context).primaryColor
      ..indicatorSize = 80.0
      ..radius = 30.0
      ..progressColor = Theme.of(context).primaryColor
      ..boxShadow = <BoxShadow>[]
      ..backgroundColor = Colors.transparent
      ..textColor = Theme.of(context).primaryColor
      ..maskColor = Theme.of(context).primaryColor.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
