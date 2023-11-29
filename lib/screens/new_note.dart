import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:npochkry/models/note.dart';
import 'package:npochkry/utils/selectColor.dart';
import 'package:npochkry/utils/textSettings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import '../utils/notesAppBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key});

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  Color editSelectColor = Colors.pink.shade200;
  TextEditingController label = TextEditingController();
  TextEditingController text = TextEditingController();
  int fontWeight = 20;
  bool _validate = false;

  saveNote() async {
    dataBox.add(
      Note(
        fontWeight: fontWeight,
        title: label.text,
        text: text.text,
        colorValue: editSelectColor.value,
      ),
    );
    print(dataBox);
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
      appBar: NotesEdAppBar(
        Icons.arrow_back_ios,
        () {
          Navigator.pop(context);
        },
        Text(
          AppLocalizations.of(context)!.yourNote,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                    color: editSelectColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Flex(
                          direction: Axis.vertical,
                          children: [
                            Align(
                              child: TextField(
                                controller: label,
                                obscureText: false,
                                decoration: InputDecoration(
                                  errorText:
                                      _validate ? "Label Cant Be Empty" : null,
                                  border: OutlineInputBorder(),
                                  labelText: 'Your Label',
                                  labelStyle: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            TextField(
                              controller: text,
                              decoration: InputDecoration(
                                errorText:
                                    _validate ? "Text Cant Be Empty" : null,
                                border: OutlineInputBorder(),
                                labelText: 'Your Text',
                                labelStyle: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            if (label.text.isEmpty == true ||
                                text.text.isEmpty == true) {
                              setState(() {
                                _validate = true;
                              });
                            } else {
                              _validate = false;
                              setState(() {
                                saveNote();
                              });
                              Navigator.pop(context);
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 16, 5, 8),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1.5),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    AppLocalizations.of(context)!.create,
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.chooseColor,
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            selectColor(
                              color: Colors.blue,
                              onTap: () {
                                setState(() {
                                  editSelectColor = Colors.blue;
                                });
                              },
                            ),
                            selectColor(
                              color: Colors.lightBlue,
                              onTap: () {
                                setState(() {
                                  editSelectColor = Colors.lightBlue;
                                });
                              },
                            ),
                            selectColor(
                              color: Colors.purple.shade300,
                              onTap: () {
                                setState(() {
                                  editSelectColor = Colors.purple.shade300;
                                });
                              },
                            ),
                            selectColor(
                              color: Colors.pink.shade200,
                              onTap: () {
                                setState(() {
                                  editSelectColor = Colors.pink.shade200;
                                });
                              },
                            ),
                            selectColor(
                              color: Colors.yellow,
                              onTap: () {
                                setState(() {
                                  editSelectColor = Colors.yellow;
                                });
                              },
                            ),
                          ],
                        ),
                        Text(
                          AppLocalizations.of(context)!.chooseText,
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  textSettings(
                                    onTap: () {
                                      setState(() {
                                        fontWeight = 20;
                                      });
                                    },
                                    textSizeType:
                                        AppLocalizations.of(context)!.low,
                                  ),
                                  textSettings(
                                    onTap: () {
                                      setState(() {
                                        fontWeight = 24;
                                      });
                                    },
                                    textSizeType:
                                        AppLocalizations.of(context)!.high,
                                  ),
                                  textSettings(
                                    onTap: () {
                                      setState(() {
                                        fontWeight = 28;
                                      });
                                    },
                                    textSizeType:
                                        AppLocalizations.of(context)!.veryhigh,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
