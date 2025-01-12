class DataStorage {
  // Variables estáticas para almacenar los datos
  static List<dynamic> jocs = [];
  static List<dynamic> consoles = [];
  static List<dynamic> personatges = [];

  // Función para actualizar los datos de los juegos
  static void setJocs(List<dynamic> newJocs) {
    jocs = newJocs;
  }

  // Función para actualizar los datos de las consolas
  static void setConsoles(List<dynamic> newConsoles) {
    consoles = newConsoles;
  }

  // Función para actualizar los datos de los personajes
  static void setPersonatges(List<dynamic> newPersonatges) {
    personatges = newPersonatges;
  }
}
