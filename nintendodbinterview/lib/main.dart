import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'view_mobile.dart';
import 'view_desktop.dart';
import 'data_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screen Size Specific Views',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variable que indica si los datos ya se cargaron
  bool isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    // Cargar los datos en segundo plano cuando la pantalla se inicie
    _loadData();
  }

  // Cargar los datos de forma asíncrona
  Future<void> _loadData() async {
    await Future.wait([
      getData('jocs'),
      getData('consoles'),
      getData('personatges'),
    ]);
    // Después de que los datos se carguen, actualizamos el estado para refrescar la UI
    setState(() {
      isDataLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NintendoDb'),
      ),
      body: isDataLoaded
          ? LayoutBuilder(
              builder: (context, constraints) {
                // Mostrar la vista correspondiente según el tamaño de la pantalla
                if (constraints.maxWidth > 450) {
                  return const ViewDesktop();
                } else {
                  return const ViewMobile();
                }
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  // Función para obtener los datos desde la API
  Future<void> getData(String type) async {
    try {
      final response =
          await http.post(Uri.parse('http://localhost:3000/api/$type'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Almacenar los datos según el tipo
        if (type == 'jocs') {
          DataStorage.setJocs(data); // Almacenar en la lista jocs
        } else if (type == 'consoles') {
          DataStorage.setConsoles(data); // Almacenar en la lista consoles
        } else if (type == 'personatges') {
          DataStorage.setPersonatges(data); // Almacenar en la lista personatges
        }

        print('Data fetched for $type: $data');
      } else {
        print('Error fetching data for $type: ${response.statusCode}');
      }
    } catch (error) {
      print('Error getting data: $error');
    }
  }
}
