import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? initialValue;
  final int? maxLines;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final Function()? onTap;
  final bool? enabled;
  final Function()? onEditingComplete;
  final TextEditingController _controller = TextEditingController();
  final TextInputAction? textInputAction;

  TextFormFieldCustom({
    super.key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.initialValue,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.onTap,
    this.enabled,
    this.onEditingComplete,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    _controller.text = initialValue ?? '';
    return TextFormField(
      autofocus: false,
      controller: _controller,
      // initialValue: initialValue,
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlign: textAlign,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      onEditingComplete: onEditingComplete,
      readOnly: readOnly,
      enabled: enabled,
      autocorrect: false,
      textInputAction: textInputAction,
      onTap: keyboardType != TextInputType.none &&
              keyboardType != TextInputType.text &&
              keyboardType != null
          ? () {
              _controller.selection = TextSelection(
                  baseOffset: 0, extentOffset: _controller.value.text.length);
            }
          : onTap,
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        icon: icon == null ? null : Icon(icon),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: Theme.of(context).primaryColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: Theme.of(context).colorScheme.error),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Theme.of(context).colorScheme.error),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
    );
  }
}
