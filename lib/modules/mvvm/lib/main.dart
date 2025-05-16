import 'package:flutter/material.dart';
import 'package:mvvm/app/application.dart' show MyApp;
import 'package:mvvm/app/dependency_injection.dart' show initModule;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initModule();
  runApp(const MyApp());
}