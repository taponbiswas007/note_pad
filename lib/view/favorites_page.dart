import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_pad/controller/note_controller.dart';
import 'package:note_pad/models/note_model.dart';
import 'package:note_pad/utils/all_colors.dart';
import 'package:note_pad/utils/all_icons.dart';
import 'package:note_pad/utils/all_styles.dart';

class FavoritePage extends StatelessWidget {
  NoteController noteController = Get.put(NoteController());
  final Box favoritenotes=Hive.box("favoritenotes");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite note".toUpperCase(),
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
      body: GetBuilder<NoteController>(
        builder: (_) {
          return ValueListenableBuilder(
            valueListenable: favoritenotes.listenable(),
            builder: (context, favoritenotes, child) {
              return ListView.builder(
                  itemCount: favoritenotes.keys.length,
                  itemBuilder: (context, index) {
                    NoteModel note = favoritenotes.getAt(index);
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  note.title,
                                  style: AllStyle.notetitleTextstyle,
                                ),
                                Container(
                                  child: InkWell(
                                    onTap: () {
                                      noteController.deletefavoriteItem(index);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0),
                                        color: AllColors.graycolor,
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            child: AllIcons.favoritIcon,
                                          )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              note.description,
                              style: AllStyle.notedescriptionTextstyle,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              note.createAt,
                              style: AllStyle.dateTextstyle,
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
          );
        },
      ),
    );
  }
}
