# [Flutter esencial](readme.md)

¡Aprende a crear aplicaciones móviles increíbles con Flutter!

## Bloc

```yaml
dependencies:
  flutter_bloc: ^9.1.1
```

Primero saber que `bloc` tiene 4 elementos: bloc, event, state y la vista.

el archivo `example_bloc.dart`

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'example_event.dart';

part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleNone()) {
    on<ExampleEvent>((event, emit) {
      switch (event) {
        case IncrementEvent _:
          if (!checkStateIsInitial()) {
            resetCounter(emit);
            return;
          }
          emit(ExampleInitial(counter: (state as ExampleInitial).counter + 1));
        case DecrementEvent _:
          if (!checkStateIsInitial()) {
            resetCounter(emit);
            return;
          }
          emit(ExampleInitial(counter: (state as ExampleInitial).counter - 1));
        case ResetEvent _:
          resetCounter(emit);
      }
    });
  }

  bool checkStateIsInitial() {
    return state is ExampleInitial;
  }

  void resetCounter(Emitter<ExampleState> emit) {
    emit(ExampleInitial(counter: 0));
  }
}
```

el archivo `example_event.dart`

```dart
part of 'example_bloc.dart';

@immutable
abstract class ExampleEvent {}

class IncrementEvent extends ExampleEvent {}

class DecrementEvent extends ExampleEvent {}

class ResetEvent extends ExampleEvent {}

```

el archivo `example_state.dart`

```dart
part of 'example_bloc.dart';

@immutable
abstract class ExampleState {
}

class ExampleInitial implements ExampleState {
  final int counter;

  ExampleInitial({required this.counter});
}

class ExampleNone implements ExampleState {}
```

el archivo `main.dart`

```dart

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<ExampleBloc>(
          create: (_) => ExampleBloc(),
          child: BlocExample(),
        ));
  }
}

class BlocExample extends StatefulWidget {
  const BlocExample({super.key});

  @override
  State<BlocExample> createState() => _BlocExampleState();
}

class _BlocExampleState extends State<BlocExample> {
  late ExampleBloc exampleBloc;

  @override
  void initState() {
    exampleBloc = BlocProvider.of<ExampleBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ExampleBloc, ExampleState>(
      builder: (context, state) {
        print(state);
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
                          exampleBloc.add(IncrementEvent());
                        },
                        icon: const Icon(Icons.add)),
                    Text(state.counter.toString()),
                    IconButton(
                        onPressed: () {
                          exampleBloc.add(DecrementEvent());
                        },
                        icon: const Icon(Icons.remove)),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      exampleBloc.add(ResetEvent());
                    },
                    child: const Text('Reset Value')),
              ],
            );
          case ExampleNone _:
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  exampleBloc.add(IncrementEvent());
                },
                child: const Text("increment"),
              ),
            );
          default:
            return const FlutterLogo();
        }
      },
    ));
  }
}
```