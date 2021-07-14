import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QASearchForm extends StatelessWidget {
  // class constructor
  final Key? key;
  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool? autofocus;
  final bool? readOnly;
  final bool? showCursor;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  const QASearchForm({
    this.key,
    this.controller,
    this.focusNode,
    this.autocorrect = true,
    this.autofocus = false,
    this.enableSuggestions = true,
    this.enabled,
    this.initialValue,
    this.hintText,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.readOnly = false,
    this.showCursor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      focusNode: focusNode,
      autocorrect: autocorrect!,
      autofocus: autofocus!,
      enableSuggestions: enableSuggestions!,
      enabled: enabled,
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLength: maxLength,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      onTap: onTap,
      readOnly: readOnly!,
      showCursor: showCursor,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(borderSide: BorderSide(), borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(), borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}