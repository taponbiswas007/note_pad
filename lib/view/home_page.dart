import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_pad/controller/note_controller.dart';
import 'package:note_pad/models/note_model.dart';
import 'package:note_pad/utils/all_colors.dart';
import 'package:note_pad/utils/all_icons.dart';
import 'package:note_pad/utils/all_styles.dart';

class Notepage extends StatelessWidget {
  NoteController noteController = Get.put(NoteController());

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
      ),
      body: GetBuilder<NoteController>(builder: (_) {
        return
        noteController.notes.isEmpty? Container(
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
        ) :ListView.builder(
            itemCount: noteController.notes.length,
            itemBuilder: (context, index) {
              NoteModel note= noteController.notes[index];
              return Card(
                child: Column(
                  children: [
                    Text(note.title,style: AllStyle.notetitleTextstyle,),
                    Text(note.description,style: AllStyle.notedescriptionTextstyle,),
                    Text(note.createAt,style: AllStyle.dateTextstyle,)
                  ],
                ),
              );
            });
      }),
    );
  }
}
