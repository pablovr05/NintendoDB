import 'package:flutter/material.dart';

class Squa extends StatelessWidget {
  final Color color;

  const Squa({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20), // Margen superior de 20px
      decoration: BoxDecoration(
        color: color, // Color de fondo del cuadrado
        border: Border.all(color: Colors.black, width: 2), // Borde negro de 2px
      ),
      width: 35, // Ancho del cuadrado
      height: 35, // Alto del cuadrado
    );
  }
}
