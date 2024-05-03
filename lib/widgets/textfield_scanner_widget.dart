import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldScannerWidget extends EditableText {
  TextFieldScannerWidget({
    super.key,
    required super.controller,
    required Function(String) super.onChanged,
    super.autofocus = true,
  }) : super(
            focusNode: TextfieldFocusNode(),
            style: const TextStyle(fontSize: 0),
            cursorColor: Colors.transparent,
            backgroundCursorColor: Colors.black);

  @override
  EditableTextState createState() {
    return TextFieldEditableState();
  }
}

class TextFieldEditableState extends EditableTextState {
  @override
  void requestKeyboard() {
    super.requestKeyboard();

    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}

class TextfieldFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    return false;
  }
}
