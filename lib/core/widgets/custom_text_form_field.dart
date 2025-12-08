import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.controller,
    this.isObscureText = false,
    this.maxLines = 1,
    this.onSaved, // default value
  });

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final int? maxLines;
  final TextEditingController? controller;
  final bool isObscureText;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      maxLines: maxLines,
      obscureText: isObscureText,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(
          color: const Color(0xFF949D9E),
        ),
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: Color(0xffE6E9E9),
        width: 1,
      ),
    );
  }
}
