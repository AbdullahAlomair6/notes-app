import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? icons;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.amber,
    this.foregroundColor = Colors.black,

    this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(text),
      icon: Icon(icons),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        fixedSize: Size(MediaQuery.of(context).size.width, 40),
      ),
    );
  }
}
