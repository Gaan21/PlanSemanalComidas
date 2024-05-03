import 'package:app_comidas_semanales/models/base/base_method_model.dart';
import 'package:app_comidas_semanales/models/base/base_model.dart';
import 'package:flutter/material.dart';

class BaseFormProvider<T extends BaseModel> extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool disabledBackPressed = false;

  T? entityOriginal;

  T? _entity;
  T? get entity => _entity;
  set entity(T? entity) {
    _entity = entity;
    notifyListeners();
  }

  List<T>? _entities;
  List<T>? get entities => _entities;
  set entities(List<T>? entities) {
    _entities = entities;
    notifyListeners();
  }

  bool hasChangedEntity() {
    return !(entity == entityOriginal) || entity == null || entity?.id == 0;
  }

  setEntityWithoutListener(T? entity) {
    _entity = entity;
    entityOriginal =
        entity != null ? (entity as BaseMethodModel).copyWith() as T : null;
  }

  setEntitiesWithoutListener(List<T> entities) {
    _entities = entities;
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
