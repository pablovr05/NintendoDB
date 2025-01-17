import 'package:flutter/material.dart';
import 'Consola.dart';
import 'Joc.dart';
import 'Pokemon.dart';

class AppData extends ChangeNotifier {
  List<Pokemon> _pokemons = [];
  List<Consola> _consoles = [];
  List<Joc> _jocs = [];

  List<Pokemon> get pokemons => _pokemons;
  List<Consola> get consoles => _consoles;
  List<Joc> get jocs => _jocs;

  void setPokemons(List<Pokemon> newPokemons) {
    _pokemons = newPokemons;
    notifyListeners();
  }

  void setConsoles(List<Consola> newConsoles) {
    _consoles = newConsoles;
    notifyListeners();
  }

  void setJocs(List<Joc> newJocs) {
    _jocs = newJocs;
    notifyListeners();
  }
}
