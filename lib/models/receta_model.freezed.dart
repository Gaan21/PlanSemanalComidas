// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receta_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecetaModel _$RecetaModelFromJson(Map<String, dynamic> json) {
  return _RecetaModel.fromJson(json);
}

/// @nodoc
mixin _$RecetaModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  set id(int value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredientes')
  List<String>? get ingredientes => throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredientes')
  set ingredientes(List<String>? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'nombre')
  String? get nombre => throw _privateConstructorUsedError;
  @JsonKey(name: 'nombre')
  set nombre(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'descripcion')
  String? get descripcion => throw _privateConstructorUsedError;
  @JsonKey(name: 'descripcion')
  set descripcion(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoria')
  String? get categoria => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoria')
  set categoria(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'momentoDia')
  MomentoDiaEnum? get momentoDia => throw _privateConstructorUsedError;
  @JsonKey(name: 'momentoDia')
  set momentoDia(MomentoDiaEnum? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tiempoPreparacion')
  int? get tiempoPreparacion => throw _privateConstructorUsedError;
  @JsonKey(name: 'tiempoPreparacion')
  set tiempoPreparacion(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'finDeSemana')
  bool get finDeSemana => throw _privateConstructorUsedError;
  @JsonKey(name: 'finDeSemana')
  set finDeSemana(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecetaModelCopyWith<RecetaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecetaModelCopyWith<$Res> {
  factory $RecetaModelCopyWith(
          RecetaModel value, $Res Function(RecetaModel) then) =
      _$RecetaModelCopyWithImpl<$Res, RecetaModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'ingredientes') List<String>? ingredientes,
      @JsonKey(name: 'nombre') String? nombre,
      @JsonKey(name: 'descripcion') String? descripcion,
      @JsonKey(name: 'categoria') String? categoria,
      @JsonKey(name: 'momentoDia') MomentoDiaEnum? momentoDia,
      @JsonKey(name: 'tiempoPreparacion') int? tiempoPreparacion,
      @JsonKey(name: 'finDeSemana') bool finDeSemana});
}

/// @nodoc
class _$RecetaModelCopyWithImpl<$Res, $Val extends RecetaModel>
    implements $RecetaModelCopyWith<$Res> {
  _$RecetaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ingredientes = freezed,
    Object? nombre = freezed,
    Object? descripcion = freezed,
    Object? categoria = freezed,
    Object? momentoDia = freezed,
    Object? tiempoPreparacion = freezed,
    Object? finDeSemana = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ingredientes: freezed == ingredientes
          ? _value.ingredientes
          : ingredientes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      nombre: freezed == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String?,
      descripcion: freezed == descripcion
          ? _value.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String?,
      categoria: freezed == categoria
          ? _value.categoria
          : categoria // ignore: cast_nullable_to_non_nullable
              as String?,
      momentoDia: freezed == momentoDia
          ? _value.momentoDia
          : momentoDia // ignore: cast_nullable_to_non_nullable
              as MomentoDiaEnum?,
      tiempoPreparacion: freezed == tiempoPreparacion
          ? _value.tiempoPreparacion
          : tiempoPreparacion // ignore: cast_nullable_to_non_nullable
              as int?,
      finDeSemana: null == finDeSemana
          ? _value.finDeSemana
          : finDeSemana // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecetaModelImplCopyWith<$Res>
    implements $RecetaModelCopyWith<$Res> {
  factory _$$RecetaModelImplCopyWith(
          _$RecetaModelImpl value, $Res Function(_$RecetaModelImpl) then) =
      __$$RecetaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'ingredientes') List<String>? ingredientes,
      @JsonKey(name: 'nombre') String? nombre,
      @JsonKey(name: 'descripcion') String? descripcion,
      @JsonKey(name: 'categoria') String? categoria,
      @JsonKey(name: 'momentoDia') MomentoDiaEnum? momentoDia,
      @JsonKey(name: 'tiempoPreparacion') int? tiempoPreparacion,
      @JsonKey(name: 'finDeSemana') bool finDeSemana});
}

/// @nodoc
class __$$RecetaModelImplCopyWithImpl<$Res>
    extends _$RecetaModelCopyWithImpl<$Res, _$RecetaModelImpl>
    implements _$$RecetaModelImplCopyWith<$Res> {
  __$$RecetaModelImplCopyWithImpl(
      _$RecetaModelImpl _value, $Res Function(_$RecetaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ingredientes = freezed,
    Object? nombre = freezed,
    Object? descripcion = freezed,
    Object? categoria = freezed,
    Object? momentoDia = freezed,
    Object? tiempoPreparacion = freezed,
    Object? finDeSemana = null,
  }) {
    return _then(_$RecetaModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ingredientes: freezed == ingredientes
          ? _value.ingredientes
          : ingredientes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      nombre: freezed == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String?,
      descripcion: freezed == descripcion
          ? _value.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String?,
      categoria: freezed == categoria
          ? _value.categoria
          : categoria // ignore: cast_nullable_to_non_nullable
              as String?,
      momentoDia: freezed == momentoDia
          ? _value.momentoDia
          : momentoDia // ignore: cast_nullable_to_non_nullable
              as MomentoDiaEnum?,
      tiempoPreparacion: freezed == tiempoPreparacion
          ? _value.tiempoPreparacion
          : tiempoPreparacion // ignore: cast_nullable_to_non_nullable
              as int?,
      finDeSemana: null == finDeSemana
          ? _value.finDeSemana
          : finDeSemana // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecetaModelImpl extends _RecetaModel with BaseModel {
  _$RecetaModelImpl(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'ingredientes') this.ingredientes,
      @JsonKey(name: 'nombre') this.nombre,
      @JsonKey(name: 'descripcion') this.descripcion,
      @JsonKey(name: 'categoria') this.categoria,
      @JsonKey(name: 'momentoDia') this.momentoDia,
      @JsonKey(name: 'tiempoPreparacion') this.tiempoPreparacion,
      @JsonKey(name: 'finDeSemana') this.finDeSemana = false})
      : super._();

  factory _$RecetaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecetaModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  int id;
  @override
  @JsonKey(name: 'ingredientes')
  List<String>? ingredientes;
  @override
  @JsonKey(name: 'nombre')
  String? nombre;
  @override
  @JsonKey(name: 'descripcion')
  String? descripcion;
  @override
  @JsonKey(name: 'categoria')
  String? categoria;
  @override
  @JsonKey(name: 'momentoDia')
  MomentoDiaEnum? momentoDia;
  @override
  @JsonKey(name: 'tiempoPreparacion')
  int? tiempoPreparacion;
  @override
  @JsonKey(name: 'finDeSemana')
  bool finDeSemana;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecetaModelImplCopyWith<_$RecetaModelImpl> get copyWith =>
      __$$RecetaModelImplCopyWithImpl<_$RecetaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecetaModelImplToJson(
      this,
    );
  }
}

abstract class _RecetaModel extends RecetaModel implements BaseModel {
  factory _RecetaModel(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'ingredientes') List<String>? ingredientes,
      @JsonKey(name: 'nombre') String? nombre,
      @JsonKey(name: 'descripcion') String? descripcion,
      @JsonKey(name: 'categoria') String? categoria,
      @JsonKey(name: 'momentoDia') MomentoDiaEnum? momentoDia,
      @JsonKey(name: 'tiempoPreparacion') int? tiempoPreparacion,
      @JsonKey(name: 'finDeSemana') bool finDeSemana}) = _$RecetaModelImpl;
  _RecetaModel._() : super._();

  factory _RecetaModel.fromJson(Map<String, dynamic> json) =
      _$RecetaModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @JsonKey(name: 'id')
  set id(int value);
  @override
  @JsonKey(name: 'ingredientes')
  List<String>? get ingredientes;
  @JsonKey(name: 'ingredientes')
  set ingredientes(List<String>? value);
  @override
  @JsonKey(name: 'nombre')
  String? get nombre;
  @JsonKey(name: 'nombre')
  set nombre(String? value);
  @override
  @JsonKey(name: 'descripcion')
  String? get descripcion;
  @JsonKey(name: 'descripcion')
  set descripcion(String? value);
  @override
  @JsonKey(name: 'categoria')
  String? get categoria;
  @JsonKey(name: 'categoria')
  set categoria(String? value);
  @override
  @JsonKey(name: 'momentoDia')
  MomentoDiaEnum? get momentoDia;
  @JsonKey(name: 'momentoDia')
  set momentoDia(MomentoDiaEnum? value);
  @override
  @JsonKey(name: 'tiempoPreparacion')
  int? get tiempoPreparacion;
  @JsonKey(name: 'tiempoPreparacion')
  set tiempoPreparacion(int? value);
  @override
  @JsonKey(name: 'finDeSemana')
  bool get finDeSemana;
  @JsonKey(name: 'finDeSemana')
  set finDeSemana(bool value);
  @override
  @JsonKey(ignore: true)
  _$$RecetaModelImplCopyWith<_$RecetaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
