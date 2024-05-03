import 'package:flutter/material.dart';

class TextLabelCustom extends StatelessWidget {
  final String value;
  final String labelText;
  const TextLabelCustom({
    super.key,
    required this.value,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            labelText,
            style: const TextStyle(fontSize: 17),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 17),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
