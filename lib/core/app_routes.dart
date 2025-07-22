import 'package:go_router/go_router.dart';
import 'package:notes_app/modules/login/view/login_screen.dart';
import 'package:notes_app/modules/login/view/signup_screen.dart';

import '../layout/home_layout.dart';

enum AppRouter { homeLayout, loginScreen, signupScreen }

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/homeLayout',
    routes: <RouteBase>[
      GoRoute(
        path: "/homeLayout",
        name: AppRouter.homeLayout.name,
        builder: (context, state) => HomeLayout(),
      ),
      GoRoute(
        path: "/loginScreen",
        name: AppRouter.loginScreen.name,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: "/signupScreen",
        name: AppRouter.signupScreen.name,
        builder: (context, state) => SignupScreen(),
      ),
    ],
  );
}
