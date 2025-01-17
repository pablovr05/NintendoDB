import 'package:flutter/material.dart';
import 'view_mobile_items.dart';

class ViewMobile extends StatelessWidget {
  const ViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    const Color color1 = Colors.red; // Color del AppBar
    const Color color2 = Colors.white; // Color de fondo general
    const Color color3 = Colors.grey; // Color del panel lateral

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nintendodb Mobile'),
          centerTitle: true,
          backgroundColor: color1,
        ),
        body: Container(
          color: color2,
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(10)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        // Navegar a la pantalla de Jocs
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ViewMobileItems(category: 'Jocs')),
                        );
                      },
                      style: TextButton.styleFrom(
                        fixedSize: const Size(125, 25),
                        backgroundColor: color3,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontFamily: "calibri",
                            fontWeight: FontWeight.bold),
                      ),
                      child: const Text(
                        "Jocs",
                        style: TextStyle(color: color2),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ViewMobileItems(category: 'Consoles')),
                        );
                      },
                      style: TextButton.styleFrom(
                        fixedSize: const Size(125, 25),
                        backgroundColor: color3,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontFamily: "calibri",
                            fontWeight: FontWeight.bold),
                      ),
                      child: const Text(
                        "Consoles",
                        style: TextStyle(color: color2),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        // Navegar a la pantalla de Pokemons
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ViewMobileItems(category: 'Pokemons')),
                        );
                      },
                      style: TextButton.styleFrom(
                        fixedSize: const Size(125, 25),
                        backgroundColor: color3,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontFamily: "calibri",
                            fontWeight: FontWeight.bold),
                      ),
                      child: const Text(
                        "Pokemons",
                        style: TextStyle(color: color2),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
