// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecetaModelImpl _$$RecetaModelImplFromJson(Map<String, dynamic> json) =>
    _$RecetaModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      ingredientes: (json['ingredientes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      nombre: json['nombre'] as String?,
      descripcion: json['descripcion'] as String?,
      categoria: json['categoria'] as String?,
      momentoDia:
          $enumDecodeNullable(_$MomentoDiaEnumEnumMap, json['momentoDia']),
      tiempoPreparacion: (json['tiempoPreparacion'] as num?)?.toInt(),
      finDeSemana: json['finDeSemana'] as bool? ?? false,
    );

Map<String, dynamic> _$$RecetaModelImplToJson(_$RecetaModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ingredientes': instance.ingredientes,
      'nombre': instance.nombre,
      'descripcion': instance.descripcion,
      'categoria': instance.categoria,
      'momentoDia': _$MomentoDiaEnumEnumMap[instance.momentoDia],
      'tiempoPreparacion': instance.tiempoPreparacion,
      'finDeSemana': instance.finDeSemana,
    };

const _$MomentoDiaEnumEnumMap = {
  MomentoDiaEnum.comida: 'comida',
  MomentoDiaEnum.cena: 'cena',
};
