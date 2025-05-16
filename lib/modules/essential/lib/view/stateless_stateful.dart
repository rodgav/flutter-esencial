import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show BuildContext, ElevatedButton, IconButton, Icons, Scaffold;

class StatelessStatefulView extends StatelessWidget {
  const StatelessStatefulView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(flex: 1, child: ExampleStateless()),
        Flexible(flex: 1, child: ExampleStateful()),
      ],
    );
  }
}

class ExampleStateless extends StatelessWidget {
  const ExampleStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: FlutterLogo()));
  }
}

class ExampleStateful extends StatefulWidget {
  const ExampleStateful({super.key});

  @override
  State<ExampleStateful> createState() => _ExampleStatefulState();
}

class _ExampleStatefulState extends State<ExampleStateful> {
  late int _count;

  @override
  void initState() {
    _count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  _count++;
                  setState(() {});
                },
                icon: const Icon(Icons.add),
              ),
              Text(_count.toString()),
              IconButton(
                onPressed: () {
                  _count--;
                  setState(() {});
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              _count = 0;
              setState(() {});
            },
            child: const Text('Reset Value'),
          ),
        ],
      ),
    );
  }
}
