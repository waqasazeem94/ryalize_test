import 'package:flutter/material.dart';

import '../constants/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hint;
  final String? labelText;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final int maxLine;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final VoidCallback? onObscureTextTap;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? filled;
  final bool readOnly;

  const CustomTextFormField({
    Key? key,
    this.focusNode,
    this.hint,
    this.obscureText = false,
    this.validator,
    this.maxLine = 1,
    this.controller,
    this.textInputType = TextInputType.text,
    this.onObscureTextTap,
    this.suffixIcon,
    this.filled = false,
    this.prefixIcon,
    this.labelText,
    this.onTap,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText!,
      maxLines: maxLine,
      validator: validator,
      onTap: onTap,
      readOnly: readOnly,
      decoration: InputDecoration(
        // labelText: labelText,
        fillColor: Colors.white,
        filled: filled,
        hintText: hint,
        hintStyle: hintStyle,
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey[700]!),
        contentPadding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
        suffixIcon: suffixIcon,
        prefix: prefixIcon,
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            borderSide: BorderSide(color: Colors.grey[700]!)),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            borderSide: BorderSide(color: Colors.grey[700]!)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            borderSide: BorderSide(color: Colors.grey[700]!)),
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            borderSide: BorderSide(color: Colors.grey[700]!)),
      ),
    );
  }
}