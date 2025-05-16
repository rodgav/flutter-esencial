import 'package:flutter/material.dart'
    show BuildContext, Image, StatelessWidget, Widget;

class AssetsView extends StatelessWidget {
  const AssetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/image.png', width: 300, height: 300);
  }
}
