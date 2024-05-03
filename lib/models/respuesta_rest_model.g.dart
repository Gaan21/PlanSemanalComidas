// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respuesta_rest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RespuestaRestModel _$RespuestaRestModelFromJson(Map<String, dynamic> json) =>
    RespuestaRestModel(
      success: json['success'] as bool,
      response: json['response'],
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RespuestaRestModelToJson(RespuestaRestModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'response': instance.response,
      'message': instance.message,
    };
