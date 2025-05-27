import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recordatoriosapp/models/Recordatorio.dart';

Future<void> guardarRecordatorioEnFirebase(Recordatorio recordatorio) async {
  try {
    final firestore = FirebaseFirestore.instance;

    // Convierte el modelo a JSON (sin campos como notificado o sincronizado, si no son necesarios en la nube)
    final json = recordatorio.toJson();

    await firestore.collection('recordatorios').add(json);

    print('✅ Recordatorio guardado exitosamente en Firebase');
  } catch (e) {
    print('❌ Error al guardar el recordatorio en Firebase: $e');
  }
}

Future<void> editarRecordatorioEnFirebase(
    String idDocumento, Recordatorio recordatorio) async {
  try {
    final firestore = FirebaseFirestore.instance;

    final json = recordatorio.toJson();

    await firestore.collection('recordatorios').doc(idDocumento).update(json);

    print('✅ Recordatorio actualizado correctamente en Firebase');
  } catch (e) {
    print('❌ Error al actualizar el recordatorio en Firebase: $e');
  }
}
