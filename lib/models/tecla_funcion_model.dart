import 'package:app_comidas_semanales/models/base/base_model.dart';
import 'package:flutter/material.dart';

class TeclaFuncionModel extends BaseModel {
  Widget widget;
  Function()? onPressed;

  TeclaFuncionModel({
    required this.widget,
    required this.onPressed,
  });
}
