// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return _LoginModel.fromJson(json);
}

/// @nodoc
mixin _$LoginModel {
  int get id => throw _privateConstructorUsedError;
  set id(int value) => throw _privateConstructorUsedError;
  String? get suscripcion => throw _privateConstructorUsedError;
  set suscripcion(String? value) => throw _privateConstructorUsedError;
  String? get usuario => throw _privateConstructorUsedError;
  set usuario(String? value) => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  set password(String? value) => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  set token(String? value) => throw _privateConstructorUsedError;
  String? get tokenUsuario => throw _privateConstructorUsedError;
  set tokenUsuario(String? value) => throw _privateConstructorUsedError;
  int? get idEntorno => throw _privateConstructorUsedError;
  set idEntorno(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginModelCopyWith<LoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginModelCopyWith<$Res> {
  factory $LoginModelCopyWith(
          LoginModel value, $Res Function(LoginModel) then) =
      _$LoginModelCopyWithImpl<$Res, LoginModel>;
  @useResult
  $Res call(
      {int id,
      String? suscripcion,
      String? usuario,
      String? password,
      String? token,
      String? tokenUsuario,
      int? idEntorno});
}

/// @nodoc
class _$LoginModelCopyWithImpl<$Res, $Val extends LoginModel>
    implements $LoginModelCopyWith<$Res> {
  _$LoginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? suscripcion = freezed,
    Object? usuario = freezed,
    Object? password = freezed,
    Object? token = freezed,
    Object? tokenUsuario = freezed,
    Object? idEntorno = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      suscripcion: freezed == suscripcion
          ? _value.suscripcion
          : suscripcion // ignore: cast_nullable_to_non_nullable
              as String?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenUsuario: freezed == tokenUsuario
          ? _value.tokenUsuario
          : tokenUsuario // ignore: cast_nullable_to_non_nullable
              as String?,
      idEntorno: freezed == idEntorno
          ? _value.idEntorno
          : idEntorno // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginModelImplCopyWith<$Res>
    implements $LoginModelCopyWith<$Res> {
  factory _$$LoginModelImplCopyWith(
          _$LoginModelImpl value, $Res Function(_$LoginModelImpl) then) =
      __$$LoginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? suscripcion,
      String? usuario,
      String? password,
      String? token,
      String? tokenUsuario,
      int? idEntorno});
}

/// @nodoc
class __$$LoginModelImplCopyWithImpl<$Res>
    extends _$LoginModelCopyWithImpl<$Res, _$LoginModelImpl>
    implements _$$LoginModelImplCopyWith<$Res> {
  __$$LoginModelImplCopyWithImpl(
      _$LoginModelImpl _value, $Res Function(_$LoginModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? suscripcion = freezed,
    Object? usuario = freezed,
    Object? password = freezed,
    Object? token = freezed,
    Object? tokenUsuario = freezed,
    Object? idEntorno = freezed,
  }) {
    return _then(_$LoginModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      suscripcion: freezed == suscripcion
          ? _value.suscripcion
          : suscripcion // ignore: cast_nullable_to_non_nullable
              as String?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenUsuario: freezed == tokenUsuario
          ? _value.tokenUsuario
          : tokenUsuario // ignore: cast_nullable_to_non_nullable
              as String?,
      idEntorno: freezed == idEntorno
          ? _value.idEntorno
          : idEntorno // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginModelImpl extends _LoginModel with BaseModel {
  _$LoginModelImpl(
      {this.id = 0,
      this.suscripcion,
      this.usuario,
      this.password,
      this.token,
      this.tokenUsuario,
      this.idEntorno})
      : super._();

  factory _$LoginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginModelImplFromJson(json);

  @override
  @JsonKey()
  int id;
  @override
  String? suscripcion;
  @override
  String? usuario;
  @override
  String? password;
  @override
  String? token;
  @override
  String? tokenUsuario;
  @override
  int? idEntorno;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginModelImplCopyWith<_$LoginModelImpl> get copyWith =>
      __$$LoginModelImplCopyWithImpl<_$LoginModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginModelImplToJson(
      this,
    );
  }
}

abstract class _LoginModel extends LoginModel implements BaseModel {
  factory _LoginModel(
      {int id,
      String? suscripcion,
      String? usuario,
      String? password,
      String? token,
      String? tokenUsuario,
      int? idEntorno}) = _$LoginModelImpl;
  _LoginModel._() : super._();

  factory _LoginModel.fromJson(Map<String, dynamic> json) =
      _$LoginModelImpl.fromJson;

  @override
  int get id;
  set id(int value);
  @override
  String? get suscripcion;
  set suscripcion(String? value);
  @override
  String? get usuario;
  set usuario(String? value);
  @override
  String? get password;
  set password(String? value);
  @override
  String? get token;
  set token(String? value);
  @override
  String? get tokenUsuario;
  set tokenUsuario(String? value);
  @override
  int? get idEntorno;
  set idEntorno(int? value);
  @override
  @JsonKey(ignore: true)
  _$$LoginModelImplCopyWith<_$LoginModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
