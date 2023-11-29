import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  String title = "";
  @HiveField(1)
  String text = "";
  @HiveField(2)
  int colorValue;
  @HiveField(3)
  int fontWeight;
  Note({
    required this.title,
    required this.text,
    required this.colorValue,
    required this.fontWeight,
  });
}
