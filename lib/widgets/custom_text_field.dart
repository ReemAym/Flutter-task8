import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hint, this.maxLines = 1, this.onSaved, this.onChanged, this.initialValue});

  final String hint;
  final int maxLines;
  final String? initialValue;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter some text';
        } else {
          return null;
        }
      },
      initialValue: initialValue,
      onChanged: onChanged,
      onSaved: onSaved,
      cursorColor: KPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: KPrimaryColor,
        ),
        border: borderStyle(),
        enabledBorder: borderStyle(),
        focusedBorder: borderStyle(KPrimaryColor),
      ),
    );
  }

  OutlineInputBorder borderStyle([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
