import 'package:app_comidas_semanales/models/enum/enum.dart';
import 'package:app_comidas_semanales/models/base/base_method_model.dart';
import 'package:app_comidas_semanales/models/base/base_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';

part 'receta_model.freezed.dart';
part 'receta_model.g.dart';

//dart run build_runner build --delete-conflicting-outputs

@unfreezed
class RecetaModel extends Equatable
    with _$RecetaModel, BaseModel
    implements BaseMethodModel {
  static const String nombreTabla = "RecetaModel";
  RecetaModel._();

  @With.fromString('BaseModel')
  factory RecetaModel({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'ingredientes') List<String>? ingredientes,
    @JsonKey(name: 'nombre') String? nombre,
    @JsonKey(name: 'descripcion') String? descripcion,
    @JsonKey(name: 'categoria') String? categoria,
    @JsonKey(name: 'momentoDia') MomentoDiaEnum? momentoDia,
    @JsonKey(name: 'tiempoPreparacion') int? tiempoPreparacion,
    @JsonKey(name: 'finDeSemana') @Default(false) bool finDeSemana,
  }) = _RecetaModel;

  factory RecetaModel.fromJson(Map<String, dynamic> json) =>
      _$RecetaModelFromJson(json);

  @override
  List<Object?> get props => [
        id,
        ingredientes,
        descripcion,
        categoria,
        momentoDia,
        tiempoPreparacion,
        finDeSemana
      ];
}
