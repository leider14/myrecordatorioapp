import 'dart:convert';

import 'package:recordatoriosapp/models/note_mode.dart';

class ApiService {
  // Simulación de envío a servidor REST
  static Future<void> sendNoteToServer(Note note) async {
    // En una aplicación real, aquí iría la llamada HTTP
    // Por ahora solo simulamos el envío mostrando el JSON en consola
    final jsonNote = note.toJson();
    print('Enviando nota al servidor: ${jsonEncode(jsonNote)}');
    
    // Simulamos un retraso de red
    await Future.delayed(const Duration(seconds: 1));
    
    print('Nota enviada con éxito!');
  }
}