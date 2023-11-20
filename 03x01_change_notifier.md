# [Flutter esencial](readme.md)

¡Aprende a crear aplicaciones móviles increíbles con Flutter!

## ChangeNotifier

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExampleStateless extends StatelessWidget {
  const ExampleStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<Counter>(
      create: (BuildContext context) {
        return Counter();
      },
      builder: (context, widget) {
        final counterProvider = Provider.of<Counter>(context, listen: false);
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
                      counterProvider.increment();
                    },
                    icon: const Icon(Icons.add)),
                Consumer<Counter>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Text(value.count.toString());
                  },
                ),
                IconButton(
                    onPressed: () {
                      counterProvider.decrement();
                    },
                    icon: const Icon(Icons.remove)),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  counterProvider.resetCount();
                },
                child: const Text('Reset Value')),
            widget ?? const Text('no data')
          ],
        );
      },child: Text('hello'),
    ));
  }
}

class Counter extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notify();
  }

  void decrement() {
    count--;
    notify();
  }

  void resetCount() {
    count = 0;
    notify();
  }

  void notify() {
    notifyListeners();
  }
}
```
