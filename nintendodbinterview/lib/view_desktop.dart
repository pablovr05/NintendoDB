import 'package:flutter/material.dart';
import 'data_storage.dart';

class ViewDesktop extends StatelessWidget {
  const ViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Agregamos MaterialApp aquí
      home: Scaffold(
        // Usamos Scaffold en lugar de CupertinoPageScaffold
        appBar: AppBar(
          title: const Text('NintendoDb Desktop'),
          centerTitle: true,
        ),
        body: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Row(
            children: [
              Container(
                width: 300, // Amplada fixa per a la columna
                color: const Color.fromARGB(255, 241, 241, 241),
                child: Column(
                  children: [
                    // DropdownButton en la parte superior de la lista
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_downward_rounded),
                        hint: const Text('Selecciona un juego'),
                        items: const [
                          DropdownMenuItem(
                            value: 'Jocs',
                            child: Text('Jocs'),
                          ),
                          DropdownMenuItem(
                            value: 'Personatges',
                            child: Text('Personatges'),
                          ),
                          DropdownMenuItem(
                            value: 'Consoles',
                            child: Text('Consoles'),
                          )
                        ],
                        onChanged: (value) {
                          // Aquí puedes manejar la selección de la opción
                          print('Juego seleccionado: $value');
                        },
                      ),
                    ),
                    // ListView que sigue debajo del Dropdown
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(8.0),
                        children: const [
                          Text(
                            'Super Mario Bros',
                            style: TextStyle(fontSize: 18),
                          ),
                          Divider(), // Separador entre els elements
                          Text(
                            'The Legend of Zelda',
                            style: TextStyle(fontSize: 18),
                          ),
                          Divider(),
                          Text(
                            'Metroid Prime',
                            style: TextStyle(fontSize: 18),
                          ),
                          Divider(),
                          Text(
                            'Donkey Kong Country',
                            style: TextStyle(fontSize: 18),
                          ),
                          Divider(),
                          Text(
                            'Animal Crossing',
                            style: TextStyle(fontSize: 18),
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Contingut principal',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
