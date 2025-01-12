import 'package:flutter/cupertino.dart';

class ViewMobile extends StatelessWidget {
  const ViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('NintendoDb Mobile'),
      ),
      child: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        constraints: const BoxConstraints.expand(),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
