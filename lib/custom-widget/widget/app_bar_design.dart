import 'package:flutter/material.dart';

class AppBarDesign extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDesign({
    super.key,
    required this.title,
    this.onPressedIcon,
    this.onPressedIconExit,
    this.exitIconShow = false,
  });

  final String title;
  final Function()? onPressedIcon;
  final Function()? onPressedIconExit;
  final bool exitIconShow;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [IconButton(onPressed: onPressedIcon, icon: Icon(Icons.add))],
      leading: exitIconShow ? IconButton(
        onPressed: onPressedIconExit,
        icon: Icon(Icons.exit_to_app_rounded),
      ) : null,
      centerTitle: false,
      backgroundColor: Colors.blueGrey,
      elevation: 2,
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      automaticallyImplyLeading: false,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
