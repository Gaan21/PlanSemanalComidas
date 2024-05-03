import 'package:app_comidas_semanales/providers/base/base_form_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickalert/quickalert.dart';

class QuickAlertWidget {
  static Future show({
    required BuildContext context,
    required BaseFormProvider? formProvider,
    String? title,
    String? text,
    Widget? widget,
    required QuickAlertType type,
    QuickAlertAnimType animType = QuickAlertAnimType.scale,
    bool barrierDismissible = true,
    VoidCallback? onConfirmBtnTap,
    VoidCallback? onCancelBtnTap,
    String? confirmBtnText,
    String? cancelBtnText,
    Color confirmBtnColor = Colors.blue,
    TextStyle? confirmBtnTextStyle,
    TextStyle? cancelBtnTextStyle,
    Color backgroundColor = Colors.white,
    Color titleColor = Colors.black,
    Color textColor = Colors.black,
    Color? barrierColor,
    bool showCancelBtn = false,
    double borderRadius = 15.0,
    String? customAsset,
    double? width,
    Duration? autoCloseDuration,
  }) async {
    try {
      formProvider?.disabledBackPressed = true;
      return await QuickAlert.show(
        context: context,
        title: title,
        text: text,
        widget: widget,
        type: type,
        animType: animType,
        barrierDismissible: barrierDismissible,
        onConfirmBtnTap: () async {
          await onConfirmBtnTapHideInput();
          if (onConfirmBtnTap != null) {
            onConfirmBtnTap();
          } else {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          }
        },
        onCancelBtnTap: () async {
          await onConfirmBtnTapHideInput();
          if (onCancelBtnTap != null) {
            onCancelBtnTap();
          } else {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          }
        },
        confirmBtnText: confirmBtnText ?? 'ok'.tr(),
        cancelBtnText: cancelBtnText ?? 'cancelar'.tr(),
        confirmBtnColor: confirmBtnColor,
        confirmBtnTextStyle: confirmBtnTextStyle,
        cancelBtnTextStyle: cancelBtnTextStyle,
        backgroundColor: backgroundColor,
        titleColor: titleColor,
        textColor: textColor,
        barrierColor: barrierColor,
        showCancelBtn: showCancelBtn,
        borderRadius: borderRadius,
        customAsset: customAsset,
        width: width,
        autoCloseDuration: autoCloseDuration,
      );
    } finally {
      formProvider?.disabledBackPressed = false;
    }
  }

  static Future<void> onConfirmBtnTapHideInput() async {
    await SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
