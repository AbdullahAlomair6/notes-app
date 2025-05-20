import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/bottom_navigation/bottom_navigation_bar.dart';
import '../modules/bottom_navigation/navigation_bloc.dart';
import '../modules/bottom_navigation/navigation_states.dart';
import '../modules/new_notes/view/new_notes_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBarCubit(),
      child: BlocConsumer<NavigationBarCubit, NavigationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: NewNotesScreen(),
            bottomNavigationBar: AppNavigationBar(),
          );
        },
      ),
    );
  }
}
