# [Flutter esencial](../readme.md)

¡Aprende a crear aplicaciones móviles increíbles con Flutter!

## Rive

config

```yaml
dependencies:
  ...
  rive: ^0.13.20

flutter:
  ...
  assets:
    - assets/animations/cat.riv
    - assets/animations/fun_night.riv
```

Ejemplo de una rive
```dart
class RiveExample extends StatefulWidget {
  const RiveExample({super.key});

  @override
  State<RiveExample> createState() => _RiveExampleState();
}

class _RiveExampleState extends State<RiveExample> {
  late RiveAnimationController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'fun',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              width: 300,
              height: 300,
              child: RiveAnimation.asset(
                'assets/animations/cat.riv',
              ),
            ),
            SizedBox(
                width: 300,
                height: 300,
                child: RiveAnimation.asset(
                  'assets/animations/fun_night.riv',
                  animations: ['fun'],
                  controllers: [_controller],
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _isPlaying ? null : _controller.isActive = true,
        tooltip: 'Play',
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
```

