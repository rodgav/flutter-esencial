# [Flutter esencial](readme.md)

¡Aprende a crear aplicaciones móviles increíbles con Flutter!

## Cubit

Primero saber que `cubit` tiene 3 elementos: cubit, state y la vista.

el archivo `example_cubit.dart`
```dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'example_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit() : super(ExampleInitial(count: 0));

  void increment() {
    if (!_checkStateIsInitial()) {
      reset();
      return;
    }
    emit(ExampleInitial(count: (state as ExampleInitial).count + 1));
  }

  void decrement() {
    if (!_checkStateIsInitial()) {
      reset();
      return;
    }
    emit(ExampleInitial(count: (state as ExampleInitial).count - 1));
  }

  void reset() => emit(ExampleInitial(count: 0));

  bool _checkStateIsInitial() {
    return state is ExampleInitial;
  }
}
```


el archivo `example_state.dart`
```dart
part of 'example_cubit.dart';

@immutable
abstract class ExampleState {}

class ExampleInitial extends ExampleState {
  final int count;

  ExampleInitial({required this.count});
}
```

el archivo `main.dart`
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental/cubit/example_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
      create: (_) => ExampleCubit(),
      child: const ExampleCubitView(),
    ));
  }
}

class ExampleCubitView extends StatefulWidget {
  const ExampleCubitView({super.key});

  @override
  State<ExampleCubitView> createState() => _ExampleCubitViewState();
}

class _ExampleCubitViewState extends State<ExampleCubitView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ExampleCubit, ExampleState>(
        builder: (context, state) {
          final cubit = context.read<ExampleCubit>();
          switch (state) {
            case ExampleInitial _:
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            cubit.increment();
                          },
                          icon: const Icon(Icons.add)),
                      Text(state.count.toString()),
                      IconButton(
                          onPressed: () {
                            cubit.decrement();
                          },
                          icon: const Icon(Icons.remove)),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        cubit.reset();
                      },
                      child: const Text('Reset Value')),
                ],
              );
            default:
              return const Center(
                child: FlutterLogo(),
              );
          }
        },
      ),
    );
  }
}
```