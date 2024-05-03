import 'package:json_annotation/json_annotation.dart';

part 'respuesta_rest_model.g.dart';

@JsonSerializable()
class RespuestaRestModel {
  final bool success;
  final Object? response;
  final String? message;

  RespuestaRestModel({
    required this.success,
    this.response,
    this.message,
  });

  factory RespuestaRestModel.fromJson(Map<String, dynamic> json) =>
      _$RespuestaRestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RespuestaRestModelToJson(this);
}
