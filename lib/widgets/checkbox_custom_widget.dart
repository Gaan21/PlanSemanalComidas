import 'package:flutter/material.dart';

class CheckboxCustomWidget extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  final String texto;

  const CheckboxCustomWidget({
    super.key,
    required this.value,
    this.onChanged,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          texto,
          style: const TextStyle(fontSize: 20),
        ),
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
