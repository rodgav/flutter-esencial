import 'package:flutter/material.dart'
    show
        BuildContext,
        Column,
        FloatingActionButton,
        Icon,
        Icons,
        Scaffold,
        SingleChildScrollView,
        SizedBox,
        State,
        StatefulWidget,
        Widget;
import 'package:rive/rive.dart'
    show OneShotAnimation, RiveAnimation, RiveAnimationController;

class RiveView extends StatefulWidget {
  const RiveView({super.key});

  @override
  State<RiveView> createState() => _RiveViewState();
}

class _RiveViewState extends State<RiveView> {
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
              child: RiveAnimation.asset('assets/animations/cat.riv'),
            ),
            SizedBox(
              width: 300,
              height: 300,
              child: RiveAnimation.asset(
                'assets/animations/fun_night.riv',
                animations: ['fun'],
                controllers: [_controller],
              ),
            ),
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
