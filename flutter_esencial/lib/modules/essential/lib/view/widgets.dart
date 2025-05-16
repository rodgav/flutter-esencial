import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show BuildContext, Colors, ElevatedButton, InkWell, StatelessWidget, Widget;

class WidgetsView extends StatelessWidget {
  const WidgetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        Text("Este es un widget de texto"),
        Container(color: Colors.blue, width: 100, height: 100),
        SizedBox(width: 100, height: 100),
        ElevatedButton(
          onPressed: () {
            //acción de usuario
          },
          child: const Text("Este es un boton"),
        ),
        GestureDetector(
          onTap: () {
            //acción de usuario
          },
          child: const FlutterLogo(),
        ),
        InkWell(
          onTap: () {
            //acción de usuario
          },
          child: const FlutterLogo(),
        ),
      ],
    );
  }
}
