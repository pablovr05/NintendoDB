import 'package:flutter/material.dart';
import 'data_storage.dart'; // Asegúrate de que este archivo está correctamente implementado

class ViewDesktop extends StatefulWidget {
  const ViewDesktop({super.key});

  @override
  _ViewDesktopState createState() => _ViewDesktopState();
}

class _ViewDesktopState extends State<ViewDesktop> {
  String? selectedCategory = 'Jocs'; // Categoría seleccionada
  Map<String, dynamic> selectedItem =
      {}; // Para almacenar el elemento seleccionado

  List<dynamic> get currentList {
    // Obtener la lista correspondiente a la categoría seleccionada
    if (selectedCategory == 'Jocs') {
      return DataStorage.jocs;
    } else if (selectedCategory == 'Consoles') {
      return DataStorage.consoles;
    } else if (selectedCategory == 'Personatges') {
      return DataStorage.personatges;
    }
    return [];
  }

  void _onItemTap(dynamic item) {
    setState(() {
      selectedItem = item; // Almacenar el elemento seleccionado
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Row(
            children: [
              Container(
                width: 300, // Ancho fijo para la columna lateral
                color: const Color.fromARGB(255, 241, 241, 241),
                child: Column(
                  children: [
                    // DropdownButton para seleccionar categoría
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_downward_rounded),
                        value: selectedCategory,
                        hint: const Text('Selecciona una categoría'),
                        items: ['Jocs', 'Consoles', 'Personatges']
                            .map((String category) {
                          return DropdownMenuItem<String>(
                            // Menú de categorías
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                      ),
                    ),
                    // ListView para mostrar la lista actual
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(14.0),
                        itemCount: currentList.length,
                        itemBuilder: (context, index) {
                          final item = currentList[index];
                          return GestureDetector(
                            // Detecta el toque en cada elemento
                            onTap: () => _onItemTap(
                                item), // Llama a la función cuando se toca
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 14.0, left: 4, top: 0, right: 0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(
                                    'http://localhost:3000/images/${item["imatge"]}',
                                    width: 40,
                                    height: 40,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    (loadingProgress
                                                            .expectedTotalBytes ??
                                                        1)
                                                : null,
                                          ),
                                        );
                                      }
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Text(
                                          'Error al cargar la imagen');
                                    },
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: Text(
                                      item["nom"].toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: selectedItem.isNotEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'http://localhost:3000/images/${selectedItem["imatge"]}',
                                width: 320,
                                height: 320,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                (loadingProgress
                                                        .expectedTotalBytes ??
                                                    1)
                                            : null,
                                      ),
                                    );
                                  }
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Text(
                                      'Error al cargar la imagen');
                                },
                              ),
                              const SizedBox(height: 20),
                              Text('Nombre: ${selectedItem["nom"]}',
                                  style: const TextStyle(fontSize: 20)),
                              Text(
                                  'Descripción: ${selectedItem["descripcion"]}',
                                  style: const TextStyle(fontSize: 20)),
                              // Aquí puedes agregar más detalles del elemento
                            ],
                          )
                        : const Text(
                            'Selecciona un elemento para ver los detalles',
                            style: TextStyle(fontSize: 20)),
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
