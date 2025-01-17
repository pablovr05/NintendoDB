// ignore: camel_case_types
class Consola {
  final String nom;
  final String descripcio;
  final String data;
  final String procesador;
  final String color;
  final int venudes;
  final String imatge;

  Consola(
      {required this.nom,
      required this.descripcio,
      required this.data,
      required this.procesador,
      required this.color,
      required this.venudes,
      required this.imatge});

  String get getNom => nom;
  String get getDescripcio => descripcio;
  String get getData => data;
  String get getProcesador => procesador;
  String get getColor => color;
  int get getVenudes => venudes;
  String get getImatge => imatge;

  factory Consola.fromJson(Map<String, dynamic> json) {
    return Consola(
        nom: json['nom'] as String,
        descripcio: json['descripció'] as String,
        data: json['data'] as String,
        procesador: json['procesador'] as String,
        color: json['color'] as String,
        venudes: json["venudes"] as int,
        imatge: json['imatge'] as String);
  }
}
