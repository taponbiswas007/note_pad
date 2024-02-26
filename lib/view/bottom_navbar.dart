import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_pad/controller/note_controller.dart';
import 'package:note_pad/models/note_model.dart';
import 'package:note_pad/utils/all_colors.dart';
import 'package:note_pad/utils/all_icons.dart';
import 'package:note_pad/utils/all_styles.dart';
import 'package:note_pad/view/favorites_page.dart';
import 'package:note_pad/view/home_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> page = [Notepage(), FavoritePage()];
  int currentIndex = 0;
  TextEditingController titleclt = TextEditingController();
  TextEditingController descriptionclt = TextEditingController();

  NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: AllIcons.addIcon,
        onPressed: () {
          openDialog(context);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: AllIcons.noteIcon,
            label: "Notes",
          ),
          BottomNavigationBarItem(
            icon: AllIcons.favoritIcon,
            label: "Favorite",
          ),
        ],
        selectedItemColor: AllColors.orangecolor,
        unselectedItemColor: AllColors.graycolor,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: page.elementAt(currentIndex),
    );
  }

  openDialog(BuildContext context) {
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
                        noteController.addnote(NoteModel(titleclt.text,
                            descriptionclt.text, DateTime.now().toString()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AllColors.bluecolor),
                      child: Text("Submit",style: TextStyle(
                        color: AllColors.whitecolor
                      ),)),
                ],
              ),
            ),
          );
        });
  }
}
