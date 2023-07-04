// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:article_app/infrastructure/ext/ctx_ext.dart';
import 'package:article_app/infrastructure/widgets/buttons/base_button.dart';
import 'package:article_app/infrastructure/widgets/buttons/button_icon_type.dart';

class AppElevatedButton extends StatelessWidget {
  final String label;
  final bool fillParent;
  final VoidCallback? onPressed;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final ButtonIconType buttonIconType;
  final bool keepBalance;
  final TextStyle? textStyle;
  final EdgeInsets padding;
  final double borderRadius;
  const AppElevatedButton(
      {Key? key,
      required this.label,
      this.fillParent = false,
      this.onPressed,
      this.prefixIcon,
      this.suffixIcon,
      this.backgroundColor,
      this.foregroundColor,
      this.buttonIconType = ButtonIconType.far,
      this.keepBalance = false,
      this.textStyle,
      this.padding = const EdgeInsets.all(12),
      this.borderRadius = 5})
      : super(key: key);

  Widget buildButton(BuildContext context) {
    final style = Theme.of(context).elevatedButtonTheme.style ??
        ElevatedButton.styleFrom();

    return ElevatedButton(
        onPressed: onPressed,
        style: style.copyWith(
            foregroundColor: MaterialStatePropertyAll(foregroundColor),
            backgroundColor: MaterialStatePropertyAll(backgroundColor),
            textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 18)),
            padding: MaterialStateProperty.all(padding),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)))),
        child: AppButtonContent(
            fillParent: fillParent,
            buttonIconType: buttonIconType,
            prefixIcon: prefixIcon,
            keepBalance: keepBalance,
            suffixIcon: suffixIcon,
            label: label,
            textStyle: textStyle));
  }

  @override
  Widget build(BuildContext context) {
    final button = buildButton(context);
    return fillParent
        ? SizedBox(
            width: double.infinity,
            child: button,
          )
        : button;
  }
}
