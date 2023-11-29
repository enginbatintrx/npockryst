import 'package:flutter/material.dart';

AppBar NotesAppBar(
  IconData icon1,
  VoidCallback icon1onTap,
  VoidCallback icon2onTap,
  Text title,
) {
  return AppBar(
    leading: IconButton(
      onPressed: icon1onTap,
      icon: Icon(
        icon1,
      ),
    ),
    title: title,
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: icon2onTap,
        icon: Icon(
          Icons.settings,
        ),
      ),
    ],
  );
}

AppBar NotesEdAppBar(
  IconData icon1,
  VoidCallback icon1onTap,
  Text title,
) {
  return AppBar(
    leading: IconButton(
      onPressed: icon1onTap,
      icon: Icon(
        icon1,
      ),
    ),
    title: title,
    centerTitle: true,
  );
}
