
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel{
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String createAt;
  NoteModel(this.title, this.description, this.createAt);
}