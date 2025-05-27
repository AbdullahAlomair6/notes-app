import 'package:flutter/material.dart';

class AppBarDesign extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDesign({super.key, required this.title, this.onPressedIcon});

  final String title;
  final Function()? onPressedIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [IconButton(onPressed: onPressedIcon, icon: Icon(Icons.add))],
      centerTitle: false,
      backgroundColor: Colors.blueGrey,
      elevation: 2,
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
