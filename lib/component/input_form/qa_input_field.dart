import 'package:flutter/material.dart';
import 'package:quantri_app/constant/color.dart';

class QAInputField extends StatelessWidget {
  final Key? key;
  final bool? obsecureText;
  final TextEditingController? controller;
  final String? hintText;
  final bool? readOnly;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const QAInputField({
    this.key,
    this.obsecureText = false,
    this.controller,
    this.hintText,
    this.readOnly = false,
    this.textInputAction,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly!,
      obscureText: obsecureText!,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      validator: (String? value) {
        if(keyboardType == TextInputType.visiblePassword) {
          if (value!.isEmpty || value.length < 6) {
            return "Password minimal 6 karakter";
          }
        } else {
          if (value!.isEmpty) {
            return "Kolom ini tidak boleh kosong";
          }
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: fillColor,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}