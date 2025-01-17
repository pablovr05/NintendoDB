class Pokemon {
  final String nom;
  final String imatge;
  final List<int> color;
  final String descripcio;
  final List<String> tipus;

  Pokemon({
    required this.nom,
    required this.imatge,
    required this.color,
    required this.descripcio,
    required this.tipus,
  });

  String get getNom => nom;
  String get getImatge => imatge;
  List<int> get getCoolor => color;
  String get getDescripcio => descripcio;
  List<String> get getTipus => tipus;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      nom: json['nom'] as String,
      imatge: json['imatge'] as String,
      color: (json['color'] as List<dynamic>).map((e) => e as int).toList(),
      descripcio: json['descripció'] as String,
      tipus: (json['tipus'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }
}
