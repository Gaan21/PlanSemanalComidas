import 'package:flutter/material.dart';

class ButtonMenuWidget extends StatelessWidget {
  final Function()? onPressed;
  final String texto;
  final IconData icon;

  const ButtonMenuWidget({
    super.key,
    required this.onPressed,
    required this.texto,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            const SizedBox(width: 15),
            Text(
              texto,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
