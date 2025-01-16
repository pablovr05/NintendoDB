import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'animals_model.dart';

class AppData extends ChangeNotifier {
  Database? _db;
  List<AnimalsModel> _animals = [];
  AnimalsModel? _selectedAnimal;

  List<AnimalsModel> get animals => _animals;
  AnimalsModel? get selectedAnimal => _selectedAnimal;

  Future<void> refreshData() async {
    if (_db != null) {
      final List<Map<String, dynamic>> maps =
          await _db!.rawQuery('SELECT * FROM animals');
      _animals = List.generate(maps.length, (i) {
        return AnimalsModel.fromMap(maps[i]);
      });
    } else {
      _animals = [];
    }
    notifyListeners();
  }

  void selectAnimal(AnimalsModel? animal) {
    _selectedAnimal = animal;
    notifyListeners();
  }
}
