import 'package:go_router/go_router.dart';
import 'package:mvvm/app/router/routes.dart' show Routes;
import 'package:flutter/material.dart';

class RouterManager {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: Routes.home,
        path: Routes.home,
        builder: (context, state) {
          //aqui podemos poner cualquier vista o widget
          return const Scaffold();
          //return const HomeView();
        },
      ),
    ],
    initialLocation: Routes.home,
    debugLogDiagnostics: true,
  );
}
