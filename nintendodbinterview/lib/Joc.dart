class Joc {
  final String nom;
  final int any;
  final String descripcio;
  final String imatge;

  Joc(
      {required this.nom,
      required this.any,
      required this.descripcio,
      required this.imatge});

  String get getNom => nom;
  int get getAny => any;
  String get getDescripcio => descripcio;
  String get getImatge => imatge;

  factory Joc.fromJson(Map<String, dynamic> json) {
    return Joc(
        nom: json['nom'] as String,
        any: json['any'] as int,
        descripcio: json['descripció'] as String,
        imatge: json['imatge'] as String);
  }
}
