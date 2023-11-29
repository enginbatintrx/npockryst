import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:npochkry/models/note.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:npochkry/utils/notesAppBar.dart';
import '../main.dart';
import '../utils/noteCards.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  deleteNote(index) async {
    dataBox = Hive.box<Note>(dataBoxName);
    dataBox.deleteAt(index);
  }

  late Box<Note> dataBox;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataBox = Hive.box<Note>(dataBoxName);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotesAppBar(
        Icons.refresh,
        () {
          setState(() {});
        },
        () {
          Navigator.pushNamed(context, '/settings');
        },
        Text(
          AppLocalizations.of(context)!.yourNotes,
        ),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: dataBox.listenable(),
            builder: (context, Box<Note> notes, _) {
              List<int> keys;

              keys = notes.keys.cast<int>().toList();

              return ListView.builder(
                itemCount: keys.length,
                itemBuilder: (context, index) {
                  final int key = keys[index];
                  final Note note = notes.get(key)!;
                  return Dismissible(
                    confirmDismiss: (DismissDirection direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              AppLocalizations.of(context)!.remove,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                              AppLocalizations.of(context)!.removetext,
                              style: GoogleFonts.roboto(fontSize: 17),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: Text(
                                  AppLocalizations.of(context)!.rbutton,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: Text(
                                  AppLocalizations.of(context)!.cbutton,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    background: Container(color: Colors.red),
                    onDismissed: (direction) async {
                      // Remove the item from the data source.

                      await deleteNote(index);
                      print(dataBox.length);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            AppLocalizations.of(context)!.dismissed,
                          ),
                        ),
                      );
                    },
                    key: UniqueKey(),
                    child: MyVerticalNote(
                      index: keys[index],
                      note: note,
                      fontWeight: note.fontWeight,
                      color: note.colorValue,
                      label: note.title,
                      text: note.text,
                    ),
                  );
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/notesNew');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
