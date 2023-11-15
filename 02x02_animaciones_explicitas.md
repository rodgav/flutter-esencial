# [Flutter esencial](readme.md)

¡Aprende a crear aplicaciones móviles increíbles con Flutter!

## Animaciones Explicitas

```dart
class ExplicitExample extends StatefulWidget {
  const ExplicitExample({super.key});

  @override
  State<ExplicitExample> createState() => _ExplicitExampleState();
}

class _ExplicitExampleState extends State<ExplicitExample>
    with TickerProviderStateMixin {
  late AnimationController gradientAnimation;
  late AnimationController alignController;
  late Animation<double> rotation;
  late Animation<AlignmentGeometry> alignment;

  @override
  void initState() {
    gradientAnimation = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    alignController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    rotation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: gradientAnimation, curve: Curves.easeInOutCubic));
    alignment = Tween<AlignmentGeometry>(
            begin: Alignment.bottomCenter, end: Alignment.topRight)
        .animate(CurvedAnimation(
            parent: alignController, curve: Curves.fastEaseInToSlowEaseOut));
    super.initState();
  }

  @override
  void dispose() {
    gradientAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RotationTransition(
              turns: rotation,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
            ),
            AnimatedBuilder(
              animation: gradientAnimation,
              builder: (context, widget) {
                return Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: const [Colors.red, Colors.purple, Colors.blue],
                      stops: [0, gradientAnimation.value, 1],
                    ),
                  ),
                );
              },
            ),
            Container(
                color: Colors.orange,
                height: 500,
                child: AlignTransition(
                    alignment: alignment,
                    child: GestureDetector(
                      child: const FlutterLogo(),
                      onTap: () {
                        alignController
                            .forward()
                            .then((value) => alignController.reset());
                      },
                    )))
          ],
        ),
      ),
    );
  }
}
```

* `SlideTransition` -> anima la posición de un widget en relación con
* `ScaleTransition` -> anima la escala de un widget
* `RotationTransition` -> anima la rotación de un widget
* `SizeTransition` -> anima su propio tamaño
* `FadeTransition` -> es una versión animada de `Opacity`
* `SliverFadeTransition` -> para atenuar y desvanecer la lista.
* `PositionedTransition` -> es una versión animada de Positioned
* `RelativePositionedTransition` -> es una versión animada de `Positioned`
* `DecoratedBoxTransition` -> es una versión animada de `DecoratedBox`
* `AlignTransition` -> es una versión animada de `Align`
* `DefaultTextStyleTransition` -> es una versión animada de DefaultTextStyle
* `AnimatedModalBarrier` -> es una versión animada de `ModalBarrier`
* `ListenableBuilder` -> utiliza un patrón de creación que es útil para casos de uso complejos `Listenable`
* `AnimatedBuilder` -> utiliza un patrón de builder que es útil para casos de uso complejos de Animación