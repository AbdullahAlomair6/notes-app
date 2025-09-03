import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color? color;
  final double height;
  final IconData? icons;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.orangeAccent,
    this.height = 50,
    this.icons,
  });

  @override
  // Widget build(BuildContext context) {
  //   return MaterialButton(
  //     onPressed: onPressed,
  //     height: height,
  //     minWidth: double.infinity,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //     color: color,
  //     child: Text(text, style: TextStyle(fontSize: 20, color: Colors.white)),
  //   );
  // }
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(text),
      icon: Icon(icons),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        fixedSize: Size(MediaQuery.of(context).size.width, 40),
      ),
    );
  }
}
