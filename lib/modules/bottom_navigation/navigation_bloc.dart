import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/modules/bottom_navigation/navigation_states.dart';

import '../archive_notes/view/archive_screen.dart';
import '../new_notes/view/new_notes_screen.dart';

class NavigationBarCubit extends Cubit<NavigationStates> {
  NavigationBarCubit() : super(InitState());

  static NavigationBarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> selectScreen = [NewNotesScreen(), ArchiveScreen()];

  void selectBottomNav(index) {
    currentIndex = index;
    emit(ChangeBottomNavState(currentIndex));
  }

  List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.add), label: 'NEW'),
    BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archive'),
  ];
}
