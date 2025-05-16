import 'package:flutter/material.dart'
    show
        AnimatedContainer,
        BlendMode,
        BuildContext,
        Color,
        ColorFilter,
        ColorFiltered,
        ColorTween,
        Colors,
        Column,
        Container,
        FlutterLogo,
        GestureDetector,
        Offset,
        Scaffold,
        SingleChildScrollView,
        SizedBox,
        State,
        StatefulWidget,
        Transform,
        Tween,
        TweenAnimationBuilder,
        Widget;

class ImplicitAnimationsView extends StatefulWidget {
  const ImplicitAnimationsView({super.key});

  @override
  State<ImplicitAnimationsView> createState() => _ImplicitAnimationsViewState();
}

class _ImplicitAnimationsViewState extends State<ImplicitAnimationsView> {
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
            const SizedBox(height: 20),
            TweenAnimationBuilder<Color?>(
              tween: ColorTween(begin: Colors.green, end: tweenAnimation),
              duration: const Duration(seconds: 1),
              builder: (context, value, widget) {
                print(value);
                return ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    value ?? Colors.transparent,
                    BlendMode.modulate,
                  ),
                  child: widget,
                );
              },
              child: const SizedBox(
                width: 300,
                height: 300,
                child: FlutterLogo(),
              ),
              onEnd: () {
                tweenAnimation = Colors.red;
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            TweenAnimationBuilder(
              tween:
                  tweenAnimation1
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
