import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/modules/bottom_navigation/navigation_states.dart';

class NavigationBarCubit extends Cubit<NavigationStates> {
  NavigationBarCubit() : super(InitState());

  static NavigationBarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void selectBottomNav(index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.add), label: 'NEW'),
    BottomNavigationBarItem(icon: Icon(Icons.delete), label: 'Delete'),
  ];
}
