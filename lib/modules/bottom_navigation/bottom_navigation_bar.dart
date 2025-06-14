import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_bloc.dart';
import 'navigation_states.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, NavigationStates>(
      builder: (context, state) {
        final cubit = NavigationBarCubit.get(context);
        return BottomNavigationBar(
          items: cubit.navItems,
          currentIndex: cubit.currentIndex,
          onTap: (index) {
            cubit.selectBottomNav(index);
          },
          backgroundColor: Colors.blueGrey[50],
          selectedItemColor: Colors.blueGrey,
          elevation: 0.0,
          showUnselectedLabels: false,
        );
      },
    );
  }
}
