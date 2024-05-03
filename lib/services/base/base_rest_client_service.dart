import 'package:retrofit/retrofit.dart';

abstract mixin class BaseRestClientService {
  Future<HttpResponse> getAll({
    required String path,
    required String authtoken,
  });
  Future<HttpResponse> getId({
    required String path,
    required int id,
    required String authtoken,
  });
  Future<HttpResponse> post<T>({
    required String path,
    required T entity,
    required String authtoken,
  });
  Future<HttpResponse> put<T>({
    required String path,
    required T entity,
    required String authtoken,
  });
}
