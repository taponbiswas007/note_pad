import 'package:get/get.dart';
import 'package:note_pad/models/note_model.dart';

class NoteController extends GetxController{
  int number= 0;
  void increamentNumber(){
    number++;
    update();
  }
  List<NoteModel> notes=[

  ];
  void addnote(NoteModel note){
    notes.add(note);
    update();
  }
}