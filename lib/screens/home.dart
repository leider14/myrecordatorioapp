import 'package:flutter/material.dart';
import 'package:recordatoriosapp/models/note_mode.dart';
import 'package:recordatoriosapp/screens/note_edit_screen.dart';
import 'package:recordatoriosapp/widgets/note_card.dart';


class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Note> notes = [
    Note(
      id: 1,
      title: 'Primera nota',
      content: 'Este es el contenido de mi primera nota',
      createdAt: DateTime.now(),
    ),
    Note(
      id: 2,
      title: 'Recordatorio importante',
      content: 'No olvidar la reunión a las 3pm',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  void _addOrEditNote({Note? noteToEdit}) async {
    final result = await Navigator.push<Note>(
      context,
      MaterialPageRoute(
        builder: (context) => NoteEditScreen(note: noteToEdit),
      ),
    );

    if (result != null) {
      setState(() {
        if (noteToEdit != null) {
          // Editar nota existente
          final index = notes.indexWhere((n) => n.id == noteToEdit.id);
          if (index != -1) {
            notes[index] = result;
          }
        } else {
          // Agregar nueva nota
          notes.add(result);
        }
      });
    }
  }

  void _deleteNote(int id) {
    setState(() {
      notes.removeWhere((note) => note.id == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nota eliminada')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Notas'),
        centerTitle: true,
      ),
      body: notes.isEmpty
          ? const Center(
              child: Text('No hay notas aún'),
            )
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return GestureDetector(
                  onTap: () => _addOrEditNote(noteToEdit: note),
                  child: NoteCard(
                    note: note,
                    onDelete: () => _deleteNote(note.id!),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrEditNote(),
        child: const Icon(Icons.add),
      ),
    );
  }
}