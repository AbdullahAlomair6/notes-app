import 'package:flutter/material.dart';

import '../modules/new_notes/view/new_notes_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: NewNotesScreen());
  }
}
