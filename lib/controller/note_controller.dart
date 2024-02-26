import 'package:get/get.dart';
import 'package:note_pad/models/note_model.dart';

class NoteController extends GetxController{
 
  List<NoteModel> notes=[];
  void addnote(NoteModel note){
    notes.add(note);
    update();
  }
  List<NoteModel> favoritelist=[];
  void deleteNote (int index){
    notes.removeAt(index);
    update();
  }
  void updateNote (NoteModel note, int index){
    notes[index]=note;
    update();
  }
  void addfavoriteItem(NoteModel note){
    favoritelist.add(note);
    update();
    print(favoritelist);
  }
  void deletefavoriteItem(int index){
    favoritelist.removeAt(index);
    update();
  }
}