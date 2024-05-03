import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class Utils {
  static String convertirMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  static List<DropdownMenuItem<int>> getDropDownMenuItemsFromMap(
      Map<int, String> mapa) {
    List<DropdownMenuItem<int>> items = <DropdownMenuItem<int>>[];

    mapa.forEach((key, value) {
      items.add(DropdownMenuItem(
        value: key,
        child: Text(
          value,
          style: const TextStyle(fontSize: 18),
        ),
      ));
    });

    return items;
  }

  static bool esValidoNumeroTelefono(String value) {
    final RegExp regex = RegExp(r"^[6789][0-9]{8}$");
    return regex.hasMatch(value);
  }

  static List<DropdownMenuItem<int>> getDropDownMenuItemsFromMapKey(
      Map<int, Map<String, String>> mapa) {
    List<DropdownMenuItem<int>> items = <DropdownMenuItem<int>>[];

    mapa.forEach((key, value) {
      items.add(DropdownMenuItem(value: key, child: Text(value.values.first)));
    });

    return items;
  }

  // static Future<bool> existeConexionInternet(
  //     {bool conexionServicios = false}) async {
  //   try {
  //     ConnectivityResult connectivityResult =
  //         await (Connectivity().checkConnectivity());

  //     if (connectivityResult == ConnectivityResult.wifi ||
  //         connectivityResult == ConnectivityResult.mobile ||
  //         connectivityResult == ConnectivityResult.ethernet) {
  //       if (!conexionServicios) {
  //         final List<InternetAddress> result =
  //             await InternetAddress.lookup('www.google.es').timeout(
  //                 const Duration(
  //                     milliseconds: GlobalValues.tiempoTimeOutConexion));
  //         if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //           return true;
  //         }
  //       } else {
  //         // RestClientMobileV2Service restClientMobileV2Service =
  //         //     GetIt.I<RestClientMobileV2Service>();

  //         // RespuestaRestModel respuestaRestModel =
  //         //     await restClientMobileV2Service.comprobarConexion().timeout(
  //         //         const Duration(
  //         //             milliseconds: GlobalValues.tiempoTimeOutConexion));
  //         // return respuestaRestModel.success;
  //         return false;
  //       }
  //     }
  //   } catch (e, s) {
  //     GlobalValues.loggerService?.exceptionTrace(e, s);
  //     return false;
  //   }

  //   return false;
  // }
}
