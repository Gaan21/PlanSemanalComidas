import 'package:app_comidas_semanales/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

class NavegacionBotonWidget extends StatelessWidget {
  final bool visibleBotonIzquierdo;
  final IconData? iconIzquierdo;
  final Color? colorIconIzquierdo;
  final Color? backgroundColorIzquierdo;
  final String? textoIzquierdo;
  final Color? colorTextoIzquierdo;
  final double? tamanoBotonIzquiedo;
  final void Function()? onPressedIzquierdo;

  final bool visibleBotonDerecho;
  final IconData? iconDerecho;
  final Color? colorIconDerecho;
  final Color? backgroundColorDerecho;
  final String? textoDerecho;
  final Color? colorTextoDerecho;
  final double? tamanoBotonDerecho;
  final void Function()? onPressedDerecho;

  const NavegacionBotonWidget({
    super.key,
    this.visibleBotonIzquierdo = true,
    this.iconIzquierdo,
    this.colorIconIzquierdo,
    this.backgroundColorIzquierdo,
    this.textoIzquierdo,
    this.colorTextoIzquierdo,
    this.onPressedIzquierdo,
    this.tamanoBotonIzquiedo,
    this.visibleBotonDerecho = false,
    this.iconDerecho,
    this.colorIconDerecho,
    this.backgroundColorDerecho,
    this.textoDerecho,
    this.colorTextoDerecho,
    this.onPressedDerecho,
    this.tamanoBotonDerecho,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5, right: 7),
      height: 100,
      width: double.infinity,
      child: Row(
        children: [
          visibleBotonIzquierdo
              ? _BotonNavegacion(
                  backgroundColor: backgroundColorIzquierdo,
                  colorIcon: colorIconIzquierdo,
                  icon: iconIzquierdo,
                  colorTexto: colorTextoIzquierdo,
                  texto: textoIzquierdo,
                  onPressed: onPressedIzquierdo,
                  tamanoBoton: tamanoBotonIzquiedo,
                )
              : const Spacer(),
          const Spacer(),
          if (visibleBotonDerecho)
            _BotonNavegacion(
              backgroundColor: backgroundColorDerecho,
              colorIcon: colorIconDerecho,
              icon: iconDerecho,
              colorTexto: colorTextoDerecho,
              texto: textoDerecho,
              onPressed: onPressedDerecho,
              tamanoBoton: tamanoBotonDerecho,
            ),
        ],
      ),
    );
  }
}

class _BotonNavegacion extends StatelessWidget {
  final IconData? icon;
  final Color? colorIcon;
  final Color? backgroundColor;
  final String? texto;
  final Color? colorTexto;
  final double? tamanoBoton;
  final void Function()? onPressed;

  const _BotonNavegacion({
    this.icon,
    this.colorIcon,
    this.backgroundColor,
    this.texto,
    this.colorTexto,
    this.onPressed,
    this.tamanoBoton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 0),
      width: tamanoBoton ?? 176,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 40,
              color: colorIcon,
            ),
            Center(
              child: Selector<IdiomaFormProvider, Locale>(
                selector: (_, provider) => provider.idioma,
                builder: (context, idioma, child) {
                  return Text(
                    (texto ?? '').tr(),
                    style: TextStyle(
                      fontSize: 27,
                      color: colorTexto,
                      overflow: TextOverflow.clip,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
