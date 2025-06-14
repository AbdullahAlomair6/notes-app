import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/bottom_navigation/bottom_navigation_bar.dart';
import '../modules/bottom_navigation/navigation_bloc.dart';
import '../modules/bottom_navigation/navigation_states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = NavigationBarCubit();
    int currentScreen = 0;
    return BlocProvider(
      create: (context) => NavigationBarCubit(),
      child: BlocBuilder<NavigationBarCubit, NavigationStates>(
        builder: (context, state) {
          if (state is ChangeBottomNavState) {
            currentScreen = state.currentIndex;
          }
          return Scaffold(
            body: cubit.selectScreen[currentScreen],
            bottomNavigationBar: AppNavigationBar(),
          );
        },
      ),
    );
  }
}
