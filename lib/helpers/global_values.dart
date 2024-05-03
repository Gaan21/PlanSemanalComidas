import 'dart:ui';
import 'package:app_comidas_semanales/models/enum/enum.dart';
import 'package:app_comidas_semanales/services/log/logger_service.dart';
import 'package:cron/cron.dart';

class GlobalValues {
  static LoggerService? loggerService;
  static String? token;
  static String urlEntorno = '';
  static String localLogoByte = '';

  static String sesionUuid = "";
  static int nivelBateria = 0;
  static bool existeConexion = false;

  static const Map<int, Locale> idiomas = {
    0: Locale("es"),
    1: Locale("en"),
  };

  static int? idiomaPorDefecto;

  static TemaEnum modoTemaPorDefecto = TemaEnum.claro;
  static final Cron cron = Cron();
  static const int tiempoTimeOutConexion = 2000;
}
