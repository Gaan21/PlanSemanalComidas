import 'package:app_comidas_semanales/models/base/base_model.dart';
import 'package:app_comidas_semanales/services/base/base_service.dart';

class ListaDiasService extends BaseService<BaseModel> {
  @override
  BaseModel entityFromMap(Map<String, Object?> res) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> entityToJson(BaseModel entity) {
    throw UnimplementedError();
  }

  // Lista de días de la semana
  List<String> diasDeLaSemana = [
    'Lunes',
    'Martes',
    'Miércoles',
    'Jueves',
    'Viernes',
    'Sábado',
    'Domingo'
  ];

//TODO: filtrar las comidas que entran en cada lista segun los parámetros
  List<String> comidas = [
    'Comida 1',
    'Comida 2',
    'Comida 3',
    'Comida 4',
    'Comida 5',
    'Comida 6',
    'Comida 7'
  ];
  List<String> cenas = [
    'Cena 1',
    'Cena 2',
    'Cena 3',
    'Cena 4',
    'Cena 5',
    'Cena 6',
    //'Cena 7'
  ];

  void mezclarComidasCenas() {
    comidas.shuffle();
    cenas.shuffle();
  }
}
