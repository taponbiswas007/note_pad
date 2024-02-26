import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:note_pad/controller/note_controller.dart';
import 'package:note_pad/models/note_model.dart';
import 'package:note_pad/routes/routes.dart';
import 'package:note_pad/utils/all_colors.dart';
import 'package:note_pad/utils/all_icons.dart';
import 'package:note_pad/utils/all_styles.dart';

class NoteDetailspage extends StatelessWidget {
  NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> note = Get.arguments;
    String title = note['title'];
    String description = note['description'];
    String create_at = note['date'];

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          title,
          style: AllStyle.titleTextStyle,
        ),
        backgroundColor: AllColors.bluecolor,
        foregroundColor: AllColors.whitecolor,
        leading: InkWell(
            onTap: () {
              Get.toNamed(bottomNavigationBar);
            },
            child: AllIcons.backIcon),
        actions: [
          InkWell(
            onTap: () {
              noteController.addfavoriteItem(NoteModel(title, description, create_at));
              Fluttertoast.showToast(msg: "favorite note added");
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: AllIcons.favoritIcon,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(create_at),
                SizedBox(
                  height: 10.0,
                ),
                Text(description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
