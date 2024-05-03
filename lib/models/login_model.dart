import 'package:app_comidas_semanales/models/base/base_method_model.dart';
import 'package:app_comidas_semanales/models/base/base_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

//dart run build_runner build --delete-conflicting-outputs

@unfreezed
class LoginModel extends Equatable
    with _$LoginModel, BaseModel
    implements BaseMethodModel {
  LoginModel._();

  static const String nombreTabla = "LoginModel";

  @With.fromString('BaseModel')
  factory LoginModel({
    @Default(0) int id,
    String? suscripcion,
    String? usuario,
    String? password,
    String? token,
    String? tokenUsuario,
    int? idEntorno,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  @override
  List<Object?> get props => [
        id,
        suscripcion,
        usuario,
        password,
        token,
        tokenUsuario,
        idEntorno,
      ];
}
