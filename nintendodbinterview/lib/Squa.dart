import 'package:flutter/material.dart';

class Squa extends StatelessWidget {
  final Color color;

  const Squa({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 2),
      ),
      width: 35,
      height: 35,
    );
  }
}
