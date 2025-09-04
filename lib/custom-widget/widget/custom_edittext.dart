import 'package:flutter/material.dart';

enum TextFormFieldType {
  email,
  phone,
  text,
  name,
  dateOfBirth,
  dropdown,
  password,
  multiline,
  search,
}

class CustomEdittext extends StatelessWidget {
  const CustomEdittext({
    super.key,
    required this.hint,
    required this.controller,
    this.minLines,
    this.maxLines = 10,
    this.type = TextFormFieldType.text,
    this.style,
    this.validator,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.isNote = false,
    this.label,
    this.fontLabelSize,
    this.fontHintSize,
    this.filled = true,
    this.obscureText = false,
    this.errorText,
    this.cursorColor = Colors.black,
  });

  final Widget? label;
  final String hint;
  final String? errorText;
  final int? minLines;
  final int maxLines;
  final TextFormFieldType type;
  final TextStyle? style;
  final TextEditingController controller;
  final bool isNote, filled;
  final bool obscureText;
  final double? fontLabelSize;
  final double? fontHintSize;
  final Color cursorColor;

  final String? Function(String? value)? validator;
  final GestureTapCallback? onTap;
  final void Function(String value)? onChanged;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(children: [SizedBox(), buildTextField()]);
  }

  Widget buildTextField() {
    return TextFormField(
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      decoration: defaultDecoration(),
      keyboardType: keyboard(),
      style: style,
      onTap: onTap,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      cursorColor: Colors.black,
    );
  }

  InputDecoration defaultDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      hintText: hint,
      hintStyle: TextStyle(fontSize: fontHintSize),
      label: label,
      filled: filled,
      fillColor: Colors.amber[100],
      errorText: errorText,
    );
  }

  TextInputType keyboard() {
    if (type == TextFormFieldType.email) {
      return TextInputType.emailAddress;
    }

    if (type == TextFormFieldType.phone) {
      return TextInputType.phone;
    }
    if (type == TextFormFieldType.password) {
      return TextInputType.visiblePassword;
    }
    if (type == TextFormFieldType.dateOfBirth) {
      return TextInputType.datetime;
    }
    if (type == TextFormFieldType.multiline) {
      return TextInputType.multiline;
    }
    return TextInputType.name;
  }
}
