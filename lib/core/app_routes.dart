import 'package:go_router/go_router.dart';

import '../layout/home_layout.dart';

enum AppRouter { homeLayout }

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/homeLayout',
    routes: <RouteBase>[
      GoRoute(
        path: "/homeLayout",
        name: AppRouter.homeLayout.name,
        builder: (context, state) => HomeLayout(),
      ),
    ],
  );
}
