import 'package:flutter/material.dart';

// ignore: must_be_immutable
class selectColor extends StatelessWidget {
  VoidCallback onTap;
  Color color;
  selectColor({
    required this.color,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: CircleAvatar(
            backgroundColor: color,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360),
            border: Border.all(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }
}
