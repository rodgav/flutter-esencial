



```yaml
  get_it: ^7.6.4
  go_router: ^12.1.0
```

app/dependency_injection.dart

```dart
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initModule(){

}
```

app/router/routes.dart
```dart
class Routes {
  static const home = '/';
}
```

app/router/router_manager.dart
```dart
import 'package:clean_mvvm/app/route/routes.dart';
import 'package:clean_mvvm/home_view.dart';
import 'package:go_router/go_router.dart';

class RouterManager {
  static GoRouter router = GoRouter(routes: [
    GoRoute(
        name: Routes.home,
        path: Routes.home,
        builder: (context, state) {
          return const HomeView();
        }),
  ], initialLocation: Routes.home, debugLogDiagnostics: true);
}

```

app/application.dart
```dart
import 'package:clean_mvvm/app/route/route.dart';
import 'package:flutter/material.dart';

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
```

main.dart
```dart
import 'package:clean_mvvm/app/aplication.dart';
import 'package:clean_mvvm/app/dependency_injection/dependency_injection.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initModule();
  runApp(const MyApp());
}
```