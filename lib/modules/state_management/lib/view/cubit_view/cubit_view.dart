import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, BlocProvider, ReadContext;
import 'package:state_management/view/cubit_view/example_cubit/example_cubit.dart';

class CubitView extends StatelessWidget {
  const CubitView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExampleCubit(),
      child: const CubitViewExample(),
    );
  }
}

class CubitViewExample extends StatefulWidget {
  const CubitViewExample({super.key});

  @override
  State<CubitViewExample> createState() => _CubitViewExampleState();
}

class _CubitViewExampleState extends State<CubitViewExample> {
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
                        icon: const Icon(Icons.add),
                      ),
                      Text(state.count.toString()),
                      IconButton(
                        onPressed: () {
                          cubit.decrement();
                        },
                        icon: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      cubit.reset();
                    },
                    child: const Text('Reset Value'),
                  ),
                ],
              );
            default:
              return const Center(child: FlutterLogo());
          }
        },
      ),
    );
  }
}
