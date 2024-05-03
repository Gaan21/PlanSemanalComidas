import 'package:app_comidas_semanales/models/base/base_model.dart';
import 'package:app_comidas_semanales/services/base/base_service.dart';

class RecetaService extends BaseService<BaseModel> {
  @override
  BaseModel entityFromMap(Map<String, Object?> res) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> entityToJson(BaseModel entity) {
    throw UnimplementedError();
  }
}
