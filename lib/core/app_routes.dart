import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/modules/login/view/login_screen.dart';
import 'package:notes_app/modules/login/view/signup_screen.dart';
import '../layout/home_layout.dart';

enum AppRouter { homeLayout, loginScreen, signupScreen }

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/loginScreen',
    routes: <RouteBase>[
      GoRoute(
        path: "/homeLayout",
        name: AppRouter.homeLayout.name,
        builder: (context, state) => const HomeLayout(),
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
      final loggingIn = state.matchedLocation == '/loginScreen' || state.matchedLocation == '/signupScreen';

      if (user == null && !loggingIn) {
        return '/loginScreen';
      } else if (user != null && loggingIn) {
        return '/homeLayout';
      }
      return null;
    },
  );
}
