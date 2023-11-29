import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:npochkry/screens/edit_note.dart';

import '../models/note.dart';

// ignore: must_be_immutable
class MyVerticalNote extends StatelessWidget {
  String label;
  String text;
  int color;
  int fontWeight;
  Note note;
  int index;
  MyVerticalNote({
    required this.index,
    required this.note,
    required this.fontWeight,
    required this.label,
    required this.text,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotesEdit(
              note: note,
              index: index,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(10),
            color: Color(color),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Flex(
                  direction: Axis.vertical,
                  children: [
                    Align(
                        child: Text(
                          label,
                          style: GoogleFonts.roboto(
                            fontSize: fontWeight.toInt() - 0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        alignment: Alignment.topLeft),
                    SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        text,
                        style: GoogleFonts.roboto(
                          fontSize: fontWeight.toInt() - 4,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
