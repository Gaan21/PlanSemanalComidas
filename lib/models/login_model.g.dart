// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginModelImpl _$$LoginModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      suscripcion: json['suscripcion'] as String?,
      usuario: json['usuario'] as String?,
      password: json['password'] as String?,
      token: json['token'] as String?,
      tokenUsuario: json['tokenUsuario'] as String?,
      idEntorno: (json['idEntorno'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LoginModelImplToJson(_$LoginModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'suscripcion': instance.suscripcion,
      'usuario': instance.usuario,
      'password': instance.password,
      'token': instance.token,
      'tokenUsuario': instance.tokenUsuario,
      'idEntorno': instance.idEntorno,
    };
