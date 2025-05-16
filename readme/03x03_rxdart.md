# [Flutter esencial](../readme.md)

¡Aprende a crear aplicaciones móviles increíbles con Flutter!

## RxDart

```yaml
dependencies:
  rxdart: ^0.28.0
```
```dart
class StreamExample extends StatefulWidget {
  const StreamExample({super.key});

  @override
  State<StreamExample> createState() => _StreamExampleState();
}

class _StreamExampleState extends State<StreamExample> {
  BehaviorSubject<int> numberStreamController = BehaviorSubject<int>.seeded(0);

  Stream<int> get numberStream =>
      numberStreamController.stream.map((number) => number);

  Sink<int> get numberSink => numberStreamController.sink;

  @override
  void initState() {
    if (numberStreamController.isClosed) {
      numberStreamController = BehaviorSubject<int>.seeded(0);
    }
    super.initState();
  }

  @override
  void dispose() {
    numberStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<int>(
          stream: numberStream,
          builder: (context, snapshot) {
            final number = snapshot.data ?? 0;
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
                          numberSink.add(number - 1);
                        },
                        icon: const Icon(Icons.add)),
                    Text(number.toString()),
                    IconButton(
                        onPressed: () {
                          numberSink.add(number + 1);
                        },
                        icon: const Icon(Icons.remove)),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      numberSink.add(0);
                    },
                    child: const Text('Reset Value')),
              ],
            );
          }),
    );
  }
}
```
