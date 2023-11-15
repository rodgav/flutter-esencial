# [Flutter esencial](readme.md)

¡Aprende a crear aplicaciones móviles increíbles con Flutter!

## Animaciones implicitas

```dart
class ImplicitExample extends StatefulWidget {
  const ImplicitExample({super.key});

  @override
  State<ImplicitExample> createState() => _ImplicitExampleState();
}

class _ImplicitExampleState extends State<ImplicitExample> {
  bool animateContainer = false;
  Color tweenAnimation = Colors.blue;
  bool tweenAnimation1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              child: AnimatedContainer(
                width: animateContainer ? 200 : 400,
                height: animateContainer ? 200 : 400,
                color: animateContainer ? Colors.blue : Colors.red,
                duration: const Duration(seconds: 1),
                child: const FlutterLogo(),
              ),
              onTap: () {
                animateContainer = !animateContainer;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TweenAnimationBuilder<Color?>(
              tween: ColorTween(begin: Colors.green, end: tweenAnimation),
              duration: const Duration(seconds: 1),
              builder: (context, value, widget) {
                print(value);
                return ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      value ?? Colors.transparent, BlendMode.modulate),
                  child: widget,
                );
              },
              child:
                  const SizedBox(width: 300, height: 300, child: FlutterLogo()),
              onEnd: () {
                tweenAnimation = Colors.red;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TweenAnimationBuilder(
                tween: tweenAnimation1
                    ? Tween(begin: 0.0, end: 1.0)
                    : Tween(begin: 1.0, end: 0.0),
                duration: const Duration(seconds: 1),
                builder: (context, value, widget) {
                  return Container(
                    color: Colors.amber,
                    child: Column(
                      children: [
                        Transform.translate(
                          offset: Offset(0.0, 50 * value),
                          child: Container(
                            color: Colors.blue,
                            width: 200,
                            height: 100,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0.0, -50 * value),
                          child: GestureDetector(
                            child: Container(
                              color: Colors.red,
                              width: 200,
                              height: 100,
                            ),
                            onTap: () {
                              tweenAnimation1 = !tweenAnimation1;
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
```
* `TweenAnimationBuilder` -> anima cualquier propiedad expresada por un `Tween` a un valor objetivo especificado
* `AnimatedAlign` -> es una versión implícitamente animada de `Align`
* `AnimatedContainer` -> es una versión implícitamente animada de `Container`
* `AnimatedDefaultTextStyle` -> es una versión implícitamente animada de `DefaultTextStyle`
* `AnimatedScale` -> es una versión implícitamente animada de `Transform.scale`
* `AnimatedRotation` -> es una versión animada implícitamente de `Transform.rotate`
* `AnimatedSlide` -> implícitamente anima la posición de un widget en relación con su posición normal
* `AnimatedOpacity` -> es una versión implícitamente animada de `Opacity`
* `AnimatedPadding` -> es una versión implícitamente animada de Padding
* `AnimatedPhysicalModel` -> es una versión implícitamente animada de `PhysicalModel`
* `AnimatedPositioned` -> una versión implícitamente animada de `Positioned`
* `AnimatedPositionedDirectional` -> es una versión implícitamente animada de `PositionedDirectional`
* `AnimatedTheme` -> es una versión implícitamente animada de Theme
* `AnimatedCrossFade` -> realiza un fundido cruzado entre dos hijos determinados y se anima entre sus tamaños
* `AnimatedSize` -> cambia automáticamente su tamaño sobre una determinada duración
* `AnimatedSwitcher` -> se desvanece de un widget a otro


