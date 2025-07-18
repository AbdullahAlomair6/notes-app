import 'package:flutter/material.dart';
import 'package:notes_app/core/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = goRouter();
    return MaterialApp.router(routerConfig: router);
  }
}
