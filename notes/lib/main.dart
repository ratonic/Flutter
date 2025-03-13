import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'notes_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa Hive
  await Hive.initFlutter();

  // Abre la caja de notas
  await Hive.openBox('notesBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notas Rápidas',
      home: NotesPage(),
    );
  }
}
