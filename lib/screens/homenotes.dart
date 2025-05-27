


import 'package:flutter/material.dart';
import 'package:recordatoriosapp/functions/functions.dart';
import 'package:recordatoriosapp/models/Recordatorio.dart';
import 'package:recordatoriosapp/utils/colors.dart';

class MyHomeNotes extends StatefulWidget {
  const MyHomeNotes({super.key});

  @override
  State<MyHomeNotes> createState() => _MyHomeNotesState();
}

class _MyHomeNotesState extends State<MyHomeNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myClrBackground,
      appBar: AppBar(
        title: Text("Mis Notas"),
        backgroundColor: myClrBackgroundCard,
        foregroundColor: myClrFontBold,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Agregar Nota"),
        icon: Icon(Icons.add),
        backgroundColor: myClrBackgroundCard,
        foregroundColor: myClrFontBold,
        onPressed: () {
          guardarRecordatorioEnFirebase(
            Recordatorio(
              id: "", 
              titulo: "Mi Primer Tarea", 
              descripcion: "Recordar Terminar con El diseño", 
              fechaHora: DateTime.now()
            )
          );
        },
      ),
    );
  }
}