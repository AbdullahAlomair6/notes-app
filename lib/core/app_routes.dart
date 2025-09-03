import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/modules/home/home_screen.dart';
import 'package:notes_app/modules/login/view/login_screen.dart';
import 'package:notes_app/modules/login/view/signup_screen.dart';

enum AppRouter { homeScreen, loginScreen, signupScreen }

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/loginScreen',
    routes: <RouteBase>[
      GoRoute(
        path: "/homeScreen",
        name: AppRouter.homeScreen.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: "/loginScreen",
        name: AppRouter.loginScreen.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: "/signupScreen",
        name: AppRouter.signupScreen.name,
        builder: (context, state) => const SignupScreen(),
      ),
    ],
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      final loggingIn =
          state.matchedLocation == '/loginScreen' ||
          state.matchedLocation == '/signupScreen';

      if (user == null && !loggingIn) {
        return '/loginScreen';
      } else if (user != null && loggingIn) {
        return '/homeScreen';
      }
      return null;
    },
  );
}
