import 'package:flutter/material.dart';

class AppBarDesign extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDesign({
    super.key,
    required this.title,
    this.onPressedIcon,
    this.onPressedIconExit,
    this.exitIconShow,
  });

  final String title;
  final Function()? onPressedIcon;
  final Function()? onPressedIconExit;
  final Widget? exitIconShow;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: onPressedIcon,
          icon: Icon(Icons.add, color: Colors.black),
        ),
      ],
      leading: exitIconShow,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
