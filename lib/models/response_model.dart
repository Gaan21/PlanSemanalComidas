import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

//dart run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class ResponseModel {
  bool? success;
  String? message;
  int? code;
  Object? response;

  ResponseModel({
    this.success,
    this.message,
    this.code,
    this.response,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
