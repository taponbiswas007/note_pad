import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:note_pad/controller/note_controller.dart';
import 'package:note_pad/models/note_model.dart';
import 'package:note_pad/routes/routes.dart';
import 'package:note_pad/utils/all_colors.dart';
import 'package:note_pad/utils/all_icons.dart';
import 'package:note_pad/utils/all_styles.dart';

class Notepage extends StatelessWidget {
  final Box box=Hive.box('notes');
  NoteController noteController = Get.put(NoteController());
  TextEditingController titleclt = TextEditingController();
  TextEditingController descriptionclt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes".toUpperCase(),
          style: AllStyle.titleTextStyle,
        ),
        backgroundColor: AllColors.bluecolor,
        foregroundColor: AllColors.whitecolor,
        actions: [
          AllIcons.selectIcon,
          SizedBox(
            width: 20.0,
          ),
          AllIcons.searchIcon,
          SizedBox(
            width: 20.0,
          ),
          AllIcons.settingsIcon
        ],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GetBuilder<NoteController>(builder: (_) {
          return
          box.keys.length==0 ? Container(
            width: Get.width,
            child: Column(
               mainAxisAlignment:MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Icon(Icons.note,size: 30.0,),
              SizedBox(height: 10.0,),
              Text("Empty Notes",
               style: AllStyle.emptyTextstyle,)
            ],),
          )
           :ValueListenableBuilder(
             valueListenable: box.listenable(),
             builder: (context, box, child) {
               return ListView.builder(
                  itemCount: box.keys.length,
                  itemBuilder: (context, index) {
                    NoteModel note= box.getAt(index);
                    return InkWell(
                      onTap: () {
                        Get.toNamed(noteDetailspage,arguments: {
                          "title":note.title, "description":note.description, "date":note.createAt
                        });
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(note.title,style: AllStyle.notetitleTextstyle,),
                                  Container(
                                    width: 80.0,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            noteController.deleteNote(index);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.0),
                                              color: AllColors.graycolor,
                                              
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Container(
                                                child: AllIcons.deletIcon,
                                              )
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.0,),
                                        InkWell(
                                          onTap: () {
                                            openDialog(context,index);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.0),
                                              color: AllColors.graycolor,
                                              
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: AllIcons.editIcon,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 8.0,),
                              Text(note.description,style: AllStyle.notedescriptionTextstyle,),
                              SizedBox(height: 5.0,),
                              Text(note.createAt,style: AllStyle.dateTextstyle,)
                            ],
                          ),
                        ),
                      ),
                    );
                  });
             }
           );
        }),
      ),
    );
  }


  
  openDialog(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (_) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                content: Column(
                  children: [
                    TextField(
                      controller: titleclt,
                      decoration: InputDecoration(hintText: "Enter title"),
                    ),
                    TextField(
                      controller: descriptionclt,
                      decoration:
                          InputDecoration(hintText: "Enter description"),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AllColors.graycolor),
                      child: Text("Cancel",style: TextStyle(
                        color: AllColors.blackcolor
                      ),)),
                  ElevatedButton(
                      onPressed: () {
                         var outputFormat = DateFormat('dd/MM/yyyy hh:mm a');
                        String create_at= outputFormat.format(DateTime.now());
                        noteController.updateNote(NoteModel(titleclt.text,
                            descriptionclt.text, create_at),index);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AllColors.bluecolor),
                          
                      child: Text("Update",style: TextStyle(
                        color: AllColors.whitecolor
                      ),)),
                ],
              ),
            ),
          );
        });
  }
}
