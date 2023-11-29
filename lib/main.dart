import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:npochkry/screens/edit_note.dart';
import 'package:npochkry/screens/new_note.dart';
import 'package:npochkry/screens/notes_list.dart';
import 'package:npochkry/screens/settings.dart';
import 'package:path_provider/path_provider.dart';
import 'models/note.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String dataBoxName = "dataSA";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(NoteAdapter());

  await Hive.openBox<Note>(dataBoxName);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale("en");

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      title: 'Notes',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => NotesList(),
        '/notesNew': (context) => NewNote(),
        '/settings': (context) => Settings(),
        '/notesEdit': (context) => NotesEdit(),
      },
    );
  }
}
