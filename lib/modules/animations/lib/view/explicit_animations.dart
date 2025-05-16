import 'package:flutter/material.dart' show AlignTransition, Alignment, AlignmentGeometry, AnimatedBuilder, Animation, AnimationController, BoxDecoration, BuildContext, Colors, Column, Container, CurvedAnimation, Curves, FlutterLogo, GestureDetector, LinearGradient, RotationTransition, Scaffold, SingleChildScrollView, State, StatefulWidget, TickerProviderStateMixin, Tween, Widget;

class ExplicitAnimationsView extends StatefulWidget {
  const ExplicitAnimationsView({super.key});

  @override
  State<ExplicitAnimationsView> createState() => _ExplicitAnimationsViewState();
}

class _ExplicitAnimationsViewState extends State<ExplicitAnimationsView>
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