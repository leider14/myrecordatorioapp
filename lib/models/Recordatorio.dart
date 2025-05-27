class Recordatorio {
  String id;
  String titulo;
  String descripcion;
  DateTime fechaHora;
  bool notificado; // Indica si ya se mostró la notificación
  bool sincronizado; // Indica si ya fue sincronizado con el servidor

  Recordatorio({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.fechaHora,
    this.notificado = false,
    this.sincronizado = false,
  });

  // Conversión a Map para SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descripcion': descripcion,
      'fechaHora': fechaHora.toIso8601String(),
      'notificado': notificado ? 1 : 0,
      'sincronizado': sincronizado ? 1 : 0,
    };
  }

  // Crear objeto desde Map (SQLite)
  factory Recordatorio.fromMap(Map<String, dynamic> map, String iddoc) {
    return Recordatorio(
      id: iddoc,
      titulo: map['titulo'],
      descripcion: map['descripcion'],
      fechaHora: DateTime.parse(map['fechaHora']),
      notificado: map['notificado'] == 1,
      sincronizado: map['sincronizado'] == 1,
    );
  }

  // Conversión a JSON (para enviar al servidor)
  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'descripcion': descripcion,
      'fechaHora': fechaHora.toIso8601String(),
    };
  }
}
