import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class settingsLangButton extends StatelessWidget {
  String textSizeType;
  VoidCallback onTap;
  String asset;
  Color buttonColor;

  settingsLangButton({
    required this.buttonColor,
    required this.asset,
    required this.onTap,
    required this.textSizeType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 0, 12, 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textSizeType,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                asset,
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class settingsThemeButton extends StatelessWidget {
  String textSizeType;
  VoidCallback onTap;

  settingsThemeButton({
    required this.onTap,
    required this.textSizeType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 0, 12, 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textSizeType,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
