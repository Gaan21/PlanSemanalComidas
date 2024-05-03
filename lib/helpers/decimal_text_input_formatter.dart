import 'package:flutter/services.dart';

import 'dart:math' as math;

extension SecondOccurenceOfSubstring on String {
  int secondIndexOf(String stringToFind) {
    if (indexOf(stringToFind) == -1) return -1;
    return indexOf(stringToFind, indexOf(stringToFind) + 1);
  }

  bool hasSecondOccurence(String stringToFind) {
    return secondIndexOf(stringToFind) != -1;
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  final int? decimalRange;

  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length >
              (decimalRange ?? 0)) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      truncated = truncated.replaceAll(',', '.');
      if (truncated.hasSecondOccurence(',') ||
          truncated.hasSecondOccurence('.')) {
        truncated = '0.00';
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
