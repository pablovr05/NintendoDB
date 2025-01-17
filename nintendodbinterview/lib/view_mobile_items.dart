import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppData.dart';
import 'Consola.dart';
import 'Joc.dart';
import 'Pokemon.dart';
import 'view_mobile_item_specs.dart';

class ViewMobileItems extends StatefulWidget {
  final String category;
  const ViewMobileItems({super.key, required this.category});

  @override
  _ViewMobileItemsState createState() => _ViewMobileItemsState();
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

class _ViewMobileItemsState extends State<ViewMobileItems> {
  dynamic selectedItem;

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);

    List<dynamic> currentList = [];
    if (widget.category == 'Jocs') {
      currentList = appData.jocs;
    } else if (widget.category == 'Consoles') {
      currentList = appData.consoles;
    } else if (widget.category == 'Pokemons') {
      currentList = appData.pokemons;
    }

    if (currentList.isNotEmpty && selectedItem == null) {
      selectedItem = currentList[0];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} View'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: currentList.length,
                itemBuilder: (context, index) {
                  final item = currentList[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ViewMobileItemSpecs(item: item),
                          ),
                        );
                      });
                    },
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
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
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
                              return const Text('Error al cargar la imagen');
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
          ),
        ],
      ),
    );
  }
}
