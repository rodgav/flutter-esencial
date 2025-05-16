import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, BlocProvider;

import 'example_bloc/example_bloc.dart';

class BlocView extends StatelessWidget {
  const BlocView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExampleBloc>(
      create: (_) => ExampleBloc(),
      child: BlocViewExample(),
    );
  }
}

class BlocViewExample extends StatefulWidget {
  const BlocViewExample({super.key});

  @override
  State<BlocViewExample> createState() => _BlocViewExample();
}

class _BlocViewExample extends State<BlocViewExample> {
  late ExampleBloc exampleBloc;

  @override
  void initState() {
    exampleBloc = BlocProvider.of<ExampleBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ExampleBloc, ExampleState>(
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
                        icon: const Icon(Icons.add),
                      ),
                      Text(state.counter.toString()),
                      IconButton(
                        onPressed: () {
                          exampleBloc.add(DecrementEvent());
                        },
                        icon: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      exampleBloc.add(ResetEvent());
                    },
                    child: const Text('Reset Value'),
                  ),
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
      ),
    );
  }
}
