import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppData.dart';
import 'Consola.dart';
import 'Joc.dart';
import 'Pokemon.dart';
import 'Squa.dart';

class ViewDesktop extends StatefulWidget {
  const ViewDesktop({super.key});

  @override
  _ViewDesktopState createState() => _ViewDesktopState();
}

class _ViewDesktopState extends State<ViewDesktop> {
  String? selectedCategory = 'Pokemons';
  dynamic selectedItem;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final appData = Provider.of<AppData>(context, listen: false);
      if (appData.pokemons.isNotEmpty) {
        setState(() {
          selectedItem = appData.pokemons[0];
        });
      }
    });
  }

  dynamic _getItem(dynamic item) {
    if (item is Joc) {
      return item;
    } else if (item is Consola) {
      return item;
    } else if (item is Pokemon) {
      return item;
    }
    return null;
  }

  List<dynamic> get currentList {
    final appData = Provider.of<AppData>(context, listen: false);
    if (selectedCategory == 'Jocs') {
      return appData.jocs;
    } else if (selectedCategory == 'Consoles') {
      return appData.consoles;
    } else if (selectedCategory == 'Pokemons') {
      return appData.pokemons;
    }
    return [];
  }

  void _onCategoryChanged(String? newCategory) {
    setState(() {
      selectedCategory = newCategory;
      final list = currentList;
      selectedItem = list.isNotEmpty ? list[0] : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color color1 = Colors.red; // Color del AppBar
    const Color color2 = Colors.white; // Color de fondo general
    const Color color3 = Colors.grey; // Color del panel lateral

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'NintendoDb Desktop',
          ),
          centerTitle: true,
          backgroundColor: color1,
        ),
        body: Container(
          color: color2,
          child: Row(
            children: [
              Container(
                width: 300,
                color: color3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_downward_rounded),
                        value: selectedCategory,
                        hint: const Text('Selecciona una categoría'),
                        items: ['Jocs', 'Consoles', 'Pokemons']
                            .map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: _onCategoryChanged,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(14.0),
                        itemCount: currentList.length,
                        itemBuilder: (context, index) {
                          final item = currentList[index];
                          return GestureDetector(
                            onTap: () => setState(() => selectedItem = item),
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 14.0, left: 4, top: 0, right: 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    'http://localhost:3000/images/${_getItem(item).imatge}',
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
                                      _getItem(item).nom,
                                      style: const TextStyle(
                                          fontSize: 20, fontFamily: "calibri"),
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
                    child: selectedItem != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'http://localhost:3000/images/${_getItem(selectedItem).imatge}',
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
                                  'Nombre: ${_getItem(selectedItem).nom}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 240),
                                child: Text(
                                  'Descripción: ${_getItem(selectedItem).getDescripcio}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 16, fontFamily: "Calibri"),
                                ),
                              ),
                              if (selectedItem is Pokemon)
                                Squa(
                                  color: Color.fromARGB(
                                      selectedItem.color[3],
                                      selectedItem.color[0],
                                      selectedItem.color[1],
                                      selectedItem.color[2]),
                                )
                              else if (selectedItem is Consola)
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        'Unidades vendidas: ${selectedItem.venudes.toString()}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Calibri"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        'Fecha de lanzamiento: ${selectedItem.data.toString()}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Calibri"),
                                      ),
                                    ),
                                  ],
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
