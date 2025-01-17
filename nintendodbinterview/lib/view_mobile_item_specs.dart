import 'package:flutter/material.dart';
import 'package:nintendodbinterview/Squa.dart';
import 'package:provider/provider.dart';

import 'AppData.dart';
import 'Consola.dart';
import 'Joc.dart';
import 'Pokemon.dart';

class ViewMobileItemSpecs extends StatelessWidget {
  final dynamic item;

  const ViewMobileItemSpecs({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details of ${item.nom}'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                'http://localhost:3000/images/${item.imatge}',
                width: 300,
                height: 300,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Error al cargar la imagen');
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Nombre: ${item.nom}',
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Calibri",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Descripción: ${item.getDescripcio}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Calibri",
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (item is Pokemon)
              Squa(
                color: Color.fromARGB(
                  item.color[3],
                  item.color[0],
                  item.color[1],
                  item.color[2],
                ),
              )
            else if (item is Consola)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'Unidades vendidas: ${item.venudes.toString()}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Calibri",
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'Fecha de lanzamiento: ${item.data.toString()}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Calibri",
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
