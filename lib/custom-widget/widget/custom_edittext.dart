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
    this.minLines = 1,
    this.maxLines = 1,
    this.type = TextFormFieldType.text,
    this.style,
    this.validator,
    this.onTap,
    required this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.isNote = false,
    this.label,
    required this.hint,
    this.fontLabelSize,
    this.fontHintSize,
    this.filled = true,
  });

  final String? label;
  final String hint;
  final int minLines;
  final int maxLines;
  final TextFormFieldType type;
  final TextStyle? style;
  final TextEditingController controller;
  final bool isNote, filled;
  final double? fontLabelSize;
  final double? fontHintSize;

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
    );
  }

  InputDecoration defaultDecoration() {
    return InputDecoration(
      contentPadding: isNote ? EdgeInsets.all(50) : null,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      hintText: hint,
      hintStyle: TextStyle(fontSize: fontHintSize),
      label:
          label != null
              ? Text(label!, style: TextStyle(fontSize: fontLabelSize))
              : null,
      filled: filled,
      fillColor: Colors.grey[100],
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
