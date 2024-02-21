import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_pad/controller/note_controller.dart';
import 'package:note_pad/utils/all_colors.dart';
import 'package:note_pad/utils/all_icons.dart';
import 'package:note_pad/utils/all_styles.dart';

class Notepage extends StatelessWidget {
  NoteController noteController= Get.put(NoteController());

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
      body: Center(
        child: Column(
        children: [
          Text("0"),
          FloatingActionButton( child: AllIcons.addIcon, onPressed: (){}),
        ],
      )),
    );
  }
}