import 'package:flutter/material.dart';
import 'data_storage.dart'; // Asegúrate de que este archivo está correctamente implementado

class ViewDesktop extends StatefulWidget {
  const ViewDesktop({super.key});

  @override
  _ViewDesktopState createState() => _ViewDesktopState();
}

class _ViewDesktopState extends State<ViewDesktop> {
  String? selectedCategory = 'Jocs'; // Categoría seleccionada

  // Obtener la lista correspondiente a la categoría seleccionada
  List<dynamic> get currentList {
    if (selectedCategory == 'Jocs') {
      return DataStorage.jocs;
    } else if (selectedCategory == 'Consoles') {
      return DataStorage.consoles;
    } else if (selectedCategory == 'Personatges') {
      return DataStorage.personatges;
    }
    return []; // Devolver lista vacía si no hay categoría seleccionada
  }

  // Función para manejar el tap en un elemento
  void onItemTapped(dynamic item) {
    // Aquí puedes hacer lo que desees con el item, por ejemplo, mostrar un dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Información del Elemento'),
          content: Text('Nombre: ${item["nom"]}\nImagen: ${item["imatge"]}'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Row(
          children: [
            Container(
              width: 300, // Ancho fijo para la columna lateral
              color: const Color.fromARGB(255, 241, 241, 241),
              child: Column(
                children: [
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
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(14.0),
                      itemCount: currentList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => print(currentList[index]),
                          child: Container(
                            margin: const EdgeInsets.only(
                                bottom: 14.0, left: 4, top: 0, right: 0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  width: 0),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  'http://localhost:3000/images/${currentList[index]["imatge"]}',
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
                                // Nombre del item
                                Expanded(
                                  child: Text(
                                    currentList[index]["nom"].toString(),
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
    );
  }
}
