import 'package:app_comidas_semanales/helpers/helpers.dart';
import 'package:app_comidas_semanales/models/base/base_model.dart';
import 'package:app_comidas_semanales/models/enum/enum.dart';
import 'package:app_comidas_semanales/models/models.dart';
import 'package:app_comidas_semanales/providers/base/base_form_provider.dart';
import 'package:app_comidas_semanales/providers/providers.dart';
import 'package:app_comidas_semanales/screens/receta_list_screen.dart';
import 'package:app_comidas_semanales/screens/screens.dart';
import 'package:app_comidas_semanales/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:retrofit/retrofit.dart';

abstract class BaseService<T extends BaseModel> {
  @protected
  String get rutaController => '';

  // Future<List<T>> getAll() async {
  //   RestClientMobileV3Service restClientMobileV3Service =
  //       GetIt.I<RestClientMobileV3Service>();

  //   List<T> entities = [];

  //   try {
  //     HttpResponse httpResponse = await restClientMobileV3Service.getAll(
  //       path: rutaController,
  //       authtoken: GlobalValues.token ?? '',
  //     );

  //     if (httpResponse.response.data is List) {
  //       for (Map<String, dynamic> elementMap in httpResponse.response.data) {
  //         T entity = entityFromMap(elementMap);
  //         entities.add(entity);
  //       }
  //     }
  //   } catch (e, s) {
  //     GlobalValues.loggerService?.exceptionTrace(e, s);
  //   }
  //   return entities;
  // }

  Future<List<T>> getAllDeleted() async {
    return [];
  }

  // Future<T?> getById(int id) async {
  //   RestClientMobileV3Service restClientMobileV3Service =
  //       GetIt.I<RestClientMobileV3Service>();

  //   try {
  //     HttpResponse httpResponse = await restClientMobileV3Service.getId(
  //       id: id,
  //       path: rutaController,
  //       authtoken: GlobalValues.token ?? '',
  //     );

  //     if (httpResponse.response.data is Map<String, dynamic>) {
  //       return entityFromMap(httpResponse.response.data);
  //     }
  //   } catch (e, s) {
  //     GlobalValues.loggerService?.exceptionTrace(e, s);
  //   }
  //   return null;
  // }

  // Future<int> update({required T? entity}) async {
  //   if (entity != null) {
  //     RestClientMobileV3Service restClientMobileV3Service =
  //         GetIt.I<RestClientMobileV3Service>();

  //     try {
  //       HttpResponse httpResponse = await restClientMobileV3Service.post(
  //           path: rutaController,
  //           entity: entity,
  //           authtoken: GlobalValues.token ?? '');

  //       if (httpResponse.response.data is Map<String, dynamic>) {
  //         BaseModel baseModel = entityFromMap(httpResponse.response.data);
  //         if (baseModel.id != 0) {
  //           return baseModel.id;
  //         }
  //       }
  //     } catch (e, s) {
  //       GlobalValues.loggerService?.exceptionTrace(e, s);
  //     }
  //   }

  //   return 0;
  // }

  // Future<int> insert({required T? entity}) async {
  //   if (entity != null) {
  //     RestClientMobileV3Service restClientMobileV3Service =
  //         GetIt.I<RestClientMobileV3Service>();

  //     try {
  //       HttpResponse httpResponse = await restClientMobileV3Service.post(
  //           path: rutaController,
  //           entity: entity,
  //           authtoken: GlobalValues.token ?? '');

  //       if (httpResponse.response.data is Map<String, dynamic>) {
  //         BaseModel baseModel = entityFromMap(httpResponse.response.data);
  //         if (baseModel.id != 0) {
  //           return baseModel.id;
  //         }
  //       }
  //     } catch (e, s) {
  //       GlobalValues.loggerService?.exceptionTrace(e, s);
  //     }
  //   }
  //   return 0;
  // }

  // Future<int> save({
  //   required T? entity,
  //   bool verifyExists = false,
  // }) async {
  //   int id = 0;
  //   if (verifyExists && entity?.id != 0) {
  //     T? entidadTemp = await getById(entity?.id ?? 0);
  //     if (entidadTemp == null) {
  //       id = await insert(entity: entity);
  //     } else {
  //       id = await update(entity: entity);
  //     }
  //   } else if (entity?.id == 0) {
  //     id = await insert(entity: entity);
  //   } else {
  //     id = await update(entity: entity);
  //   }

  //   return id;
  // }

  // Future<int> saveMultiple(
  //     {required List<T> entities, bool verifyExists = false}) async {
  //   for (T entity in entities) {
  //     save(entity: entity);
  //   }
  //   return 1;
  // }

  // Future<int> delete({required int id}) async {
  //   RestClientMobileV3Service restClientMobileV3Service =
  //       GetIt.I<RestClientMobileV3Service>();

  //   try {
  //     bool resultado = await restClientMobileV3Service.delete(
  //         path: rutaController, id: id, authtoken: GlobalValues.token ?? '');

  //     if (resultado) {
  //       return 1;
  //     }
  //   } catch (e, s) {
  //     GlobalValues.loggerService?.exceptionTrace(e, s);
  //   }
  //   return 0;
  // }

  List<T> entitiesFromMap(final List<Map<String, Object?>> res) =>
      res.isNotEmpty ? res.map((s) => entityFromMap(s)).toList() : [];

  T entityFromMap(final Map<String, Object?> res);
  Map<String, dynamic> entityToJson(final T entity);

  // Future<bool> comprobarConexion() async {
  //   RespuestaRestModel? respuestaRestModel;

  //   try {
  //     RestClientMobileV2Service restClientMobileV2Service =
  //         GetIt.I<RestClientMobileV2Service>();

  //     respuestaRestModel = await restClientMobileV2Service.comprobarConexion();
  //   } catch (e, s) {
  //     GlobalValues.loggerService?.exceptionTrace(e, s);
  //     GlobalValues.loggerService?.info('No existe conexión a internet');
  //   }

  //   return respuestaRestModel?.success ?? false;
  // }
}
