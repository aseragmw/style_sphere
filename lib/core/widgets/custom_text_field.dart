import 'package:flutter/material.dart';
import 'package:style_sphere/core/extentions/screen_size.dart';
import 'package:style_sphere/core/utils/app_theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.trailingIcon,
    required this.obsecured,
    required this.controller,
    required this.filled,
    this.fillColor,
    this.inputType,
    this.minLines,
    this.maxLines,
    this.borderRadius,
    required this.borderEnabled,
  });
  final String hintText;
  final Widget? trailingIcon;
  final bool? obsecured;
  final bool filled;
  final Color? fillColor;
  final TextEditingController controller;
  final TextInputType? inputType;
  final int? minLines;
  final int? maxLines;
  final BorderRadius? borderRadius;
  final bool borderEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: fillColor,
      padding: EdgeInsets.all(context.screenAspectRatio),
      child: TextFormField(
        controller: controller,
        minLines: minLines,
        maxLines: maxLines ?? 1,
        obscureText: obsecured ?? false,
        keyboardType: inputType,
        decoration: InputDecoration(
            fillColor: fillColor ?? Colors.transparent,
            filled: filled,
            focusedBorder: borderEnabled ? OutlineInputBorder(borderRadius: borderRadius ?? AppTheme.boxRadius) : InputBorder.none,
            hintText: hintText,
            suffixIcon: trailingIcon,
            border: borderEnabled ? OutlineInputBorder(borderRadius: borderRadius ?? AppTheme.boxRadius) : InputBorder.none),
      ),
    );
  }
}
