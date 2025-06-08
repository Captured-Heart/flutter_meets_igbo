// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_meets_igbo/config/extensions/extensions.dart';
import 'package:flutter_meets_igbo/config/theme/app_style.dart';
import 'package:flutter_meets_igbo/config/theme/app_theme.dart';
import 'package:flutter_meets_igbo/config/theme/text_theme.dart';

class AuthTextFieldWidget extends StatefulWidget {
  const AuthTextFieldWidget({
    super.key,
    required this.controller,
    this.focusNode,
    this.inputFormatters,
    this.hintText,
    this.errorText,
    this.initialValue,
    this.onChanged,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.onTap,
    this.prefixIcon,
    this.filled,
    this.autoFocus,
    this.readOnly,
    this.fillColor,
    this.maxLength,
    this.label,
    this.textInputAction,
    this.validator,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final String? errorText;
  final String? initialValue;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final bool? filled;
  final bool? autoFocus;
  final bool? readOnly;
  final Color? fillColor;
  final int? maxLength;
  final String? label;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;

  @override
  State<AuthTextFieldWidget> createState() => _AuthTextFieldWidgetState();
}

class _AuthTextFieldWidgetState extends State<AuthTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final borderDesign = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(width: 0.3, color: context.theme.textTheme.bodyMedium!.color!),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label ?? '', style: context.textTheme.bodyMedium?.copyWith(fontWeight: AppFontWeight.w600)).padOnly(bottom: 7),
        TextFormField(
          onTap: widget.onTap,
          initialValue: widget.initialValue,
          controller: widget.controller,
          focusNode: widget.focusNode,
          readOnly: widget.readOnly ?? false,
          autofocus: widget.autoFocus ?? false,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          maxLength: widget.maxLength,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          cursorColor: context.theme.primaryColor,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autocorrect: false,
          validator: widget.validator,
          style: AppTextStyle.bodyMedium,
          inputFormatters:
              // ignore: prefer_single_quotes
              widget.inputFormatters ?? [FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))],
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            fillColor: widget.fillColor ?? context.theme.scaffoldBackgroundColor,
            filled: widget.filled,
            errorStyle: AppTextStyle.errorTextstyle,

            hintStyle: AppTextStyle.bodySmall.copyWith(fontWeight: AppFontWeight.w100),
            // suffixIconColor: LearnGualColor.textDark,,
            // prefixIconColor: LearnGualColor.textDark,,
            border: borderDesign,
            focusedBorder: borderDesign,
            enabledBorder: borderDesign,
            errorBorder: borderDesign,
            errorMaxLines: 1,
            // errorStyle: AppTextStyle().errorTextStyle,
          ),
        ),
      ],
    );
  }
}

// Widget authTextFieldWidget({
//   required TextEditingController controller,
//   required BuildContext context,
//   FocusNode? focusNode,
//   List<TextInputFormatter>? inputFormatters,
//   String? hintText,
//   String? errorText,
//   String? initialValue,
//   Function(String)? onChanged,
//   Widget? suffixIcon,
//   bool obscureText = false,
//   TextInputType? keyboardType,
//   VoidCallback? onTap,
//   Widget? prefixIcon,
//   bool? filled,
//   bool? autoFocus,
//   bool? readOnly,
//   Color? fillColor,
//   int? maxLength,
//   String? label,
//   TextInputAction? textInputAction,
//   String? Function(String?)? validator,
// }) {
//   return;
// }
