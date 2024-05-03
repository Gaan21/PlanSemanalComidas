import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldTecladoWidget extends StatelessWidget {
  final BuildContext context;
  final String labelText;
  final String initialValue;
  final Function()? onTap;
  final bool obscureText;
  final bool campoObligatorio;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final List<TextInputFormatter>? inputFormatters;

  const TextFormFieldTecladoWidget({
    super.key,
    required this.context,
    required this.labelText,
    required this.initialValue,
    this.textStyle,
    this.onTap,
    this.obscureText = false,
    this.campoObligatorio = true,
    this.textAlign,
    this.maxLength,
    this.maxLengthEnforcement,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: GlobalKey(),
      readOnly: true,
      keyboardType: TextInputType.none,
      initialValue: initialValue,
      obscureText: obscureText,
      style: textStyle ?? const TextStyle(fontSize: 20),
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      onTap: onTap,
      textAlign: textAlign ?? TextAlign.start,
      validator: campoObligatorio
          ? (value) {
              if (value == null || value == "") {
                return "campo_obligatorio".tr();
              }
              return null;
            }
          : null,
    );
  }
}
