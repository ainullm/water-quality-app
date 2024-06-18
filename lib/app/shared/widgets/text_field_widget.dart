import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/styles/app_colors.dart';

class MyTextFieldWidget extends StatelessWidget {
  const MyTextFieldWidget({
    super.key,
    this.labelText,
    this.controller,
    this.prefix,
    this.suffix,
    this.contentPadding,
    this.keyboardType,
    this.onChanged,
    this.obscureText,
    this.autofocus,
    this.focusNode,
    this.maxLines,
    this.padding,
    this.validator,
    this.labelStyle,
    this.inputFormatters,
    this.enabled,
    this.hintText,
    this.colorOnFocus,
    this.colorBackground,
    this.hintStyle,
    this.colorOffFocus,
  });

  final String? labelText;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffix;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? padding;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool? obscureText;
  final bool? autofocus;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextStyle? labelStyle;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final String? hintText;
  final Color? colorOnFocus;
  final Color? colorOffFocus;
  final Color? colorBackground;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        keyboardAppearance: Brightness.dark,
        enabled: enabled ?? true,
        inputFormatters: inputFormatters,
        validator: validator,
        autofocus: autofocus ?? false,
        focusNode: focusNode,
        maxLines: maxLines ?? 1,
        style: Theme.of(context).textTheme.bodyMedium,
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
            filled: true,
            fillColor: colorBackground ?? white,
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(10),
            //   borderSide: BorderSide(
            //     color: colorOnFocus ?? black2,
            //     width: 1,
            //   ),
            // ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: colorOnFocus ?? black2,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: colorOffFocus ?? black2,
                width: 1,
              ),
            ),
            floatingLabelStyle:
                Theme.of(context).textTheme.bodyMedium?.copyWith(color: black1),
            prefixIcon: prefix,
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 35,
              maxWidth: 35,
            ),
            suffixIcon: suffix,
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 35,
              maxWidth: 35,
            ),
            contentPadding:
                contentPadding ?? const EdgeInsets.symmetric(horizontal: 20),
            hintText: hintText,
            hintStyle: hintStyle ??
                Theme.of(context).textTheme.bodyMedium?.copyWith(color: grey),
            labelText: labelText,
            labelStyle: labelStyle ??
                Theme.of(context).textTheme.bodyMedium?.copyWith(color: grey)),
      ),
    );
  }
}
