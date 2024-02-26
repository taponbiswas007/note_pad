import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:note_pad/models/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NoteController extends GetxController{
 
  List<NoteModel> notes=[];

  final Box box=Hive.box("notes");
  final Box favoritenotes=Hive.box("favoritenotes");
  void addnote(NoteModel note){
    box.add(note);
    update();
  }
  List<NoteModel> favoritelist=[];
  void deleteNote (int index){
    box.deleteAt(index);
    update();
  }
  void updateNote (NoteModel note, int index){
    box.putAt(index, note);
    update();
  }
  void addfavoriteItem(NoteModel note){
    favoritenotes.add(note);
    Fluttertoast.showToast(msg: "favorite note added");
    update();
   
  }
  void deletefavoriteItem(int index){
    favoritenotes.deleteAt(index);
    update();
  }
}