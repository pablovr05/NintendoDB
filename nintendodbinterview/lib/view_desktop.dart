import 'package:flutter/material.dart';
import 'data_storage.dart';

class ViewDesktop extends StatefulWidget {
  const ViewDesktop({super.key});

  @override
  _ViewDesktopState createState() => _ViewDesktopState();
}

class _ViewDesktopState extends State<ViewDesktop> {
  String? selectedCategory = 'pokemons';
  Map<String, dynamic> selectedItem = DataStorage.pokemons[0];

  List<dynamic> get currentList {
    if (selectedCategory == 'Jocs') {
      return DataStorage.jocs;
    } else if (selectedCategory == 'Consoles') {
      return DataStorage.consoles;
    } else if (selectedCategory == 'pokemons') {
      return DataStorage.pokemons;
    }
    return [];
  }

  void _onItemTap(dynamic item) {
    setState(() {
      selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 219, 225, 255),
          child: Row(
            children: [
              Container(
                width: 300,
                color: const Color.fromARGB(255, 200, 209, 254),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_downward_rounded),
                        value: selectedCategory,
                        hint: const Text('Selecciona una categoría'),
                        items: ['Jocs', 'Consoles', 'pokemons']
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
                          final item = currentList[index];
                          return GestureDetector(
                            onTap: () => _onItemTap(item),
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 14.0, left: 4, top: 0, right: 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      style: const TextStyle(fontSize: 20),
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
                                width: 340,
                                height: 340,
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
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30),
                                child: Text(
                                  'Nombre: ${selectedItem["nom"]}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 240),
                                child: Text(
                                  'Descripción: ${selectedItem["descripció"]}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 20, fontFamily: "Calibri"),
                                ),
                              ),
                            ],
                          )
                        : const Text(
                            'Selecciona un elemento para ver los detalles',
                            style: TextStyle(fontSize: 20),
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
