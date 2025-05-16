import 'package:flutter/material.dart';
import 'package:mvvm/app/router/router_manager.dart' show RouterManager;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: RouterManager.router.routeInformationParser,
      routeInformationProvider: RouterManager.router.routeInformationProvider,
      routerDelegate: RouterManager.router.routerDelegate,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}