abstract class NavigationStates {}

class InitState extends NavigationStates {}

class ChangeBottomNavState extends NavigationStates {
  final int currentIndex;

  ChangeBottomNavState(this.currentIndex);
}
