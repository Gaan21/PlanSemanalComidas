import 'package:flutter/material.dart';

class CheckboxFieldCustom extends FormField<bool> {
  final String formProperty;
  final Map<String, String> formValues;

  CheckboxFieldCustom({
    super.key,
    required Widget title,
    super.onSaved,
    super.validator,
    bool super.initialValue = false,
    bool autovalidate = false,
    required this.formProperty,
    required this.formValues,
  }) : super(
          builder: (FormFieldState<bool> state) {
            return CheckboxListTile(
              dense: state.hasError,
              title: title,
              value: state.value,
              onChanged: (value) => formValues[formProperty] = value.toString(),
              subtitle: state.hasError
                  ? Builder(
                      builder: (BuildContext context) => Text(
                        "state.errorText",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                      ),
                    )
                  : null,
              controlAffinity: ListTileControlAffinity.leading,
            );
          },
        );
}
