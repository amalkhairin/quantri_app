import 'package:flutter/material.dart';
import 'package:quantri_app/constant/color.dart';

class QADropdownInputField extends StatefulWidget {
  final Key? key;
  final String? hintText;
  final String? value;
  final List<String>? items;
  final Function(String?)? onChanged;
  const QADropdownInputField({
    this.key,
    this.hintText,
    @required this.value,
    @required this.items,
    this.onChanged
  }) : super(key: key);

  @override
  State<QADropdownInputField> createState() => _QADropdownInputFieldState();
}

class _QADropdownInputFieldState extends State<QADropdownInputField> {
  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (String? value) {
        if (widget.value == null) {
          return "Kolom ini tidak boleh kosong";
        }
      },
      builder: (FormFieldState<String> state){
        return InputDecorator(
          decoration: InputDecoration(
            errorText: state.errorText,
            hintText: widget.hintText,
            filled: true,
            fillColor: fillColor,
            border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
          ),
          isEmpty: widget.value == null,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: widget.value,
              isDense: true,
              onChanged: widget.onChanged,
              items: widget.items != null? widget.items!.map((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              )).toList() : null,
            ),
          ),
        );
      },
    );
  }
}