import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:npochkry/main.dart';
import 'package:npochkry/utils/notesAppBar.dart';
import 'package:npochkry/utils/settingsButton.dart';
import 'package:npochkry/utils/textSettings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotesEdAppBar(
        Icons.arrow_back_ios,
        () {
          Navigator.pop(context);
        },
        Text(
          AppLocalizations.of(context)!.settings,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            languagesSettings(
              settingsType: AppLocalizations.of(context)!.languages,
              button1Type: "RU",
              button1Tap: () {
                setState(() {
                  MyApp.of(context)!
                      .setLocale(Locale.fromSubtags(languageCode: 'ru'));
                });
              },
              button2Type: "EN",
              button2Tap: () {
                setState(() {
                  MyApp.of(context)!
                      .setLocale(Locale.fromSubtags(languageCode: 'en'));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class languagesSettings extends StatelessWidget {
  String settingsType;
  String button1Type;
  String button2Type;
  VoidCallback button1Tap;
  VoidCallback button2Tap;

  languagesSettings({
    required this.button1Tap,
    required this.button1Type,
    required this.button2Tap,
    required this.button2Type,
    required this.settingsType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              settingsType,
              style: GoogleFonts.roboto(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: settingsLangButton(
              buttonColor: Colors.blue,
              onTap: button1Tap,
              textSizeType: button1Type,
              asset: "assets/ru.png",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: settingsLangButton(
              buttonColor: Colors.grey.shade900,
              onTap: button2Tap,
              textSizeType: button2Type,
              asset: "assets/uk.png",
            ),
          ),
        ],
      ),
    );
  }
}
