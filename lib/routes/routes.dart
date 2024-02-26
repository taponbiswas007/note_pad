
import 'package:get/get.dart';
import 'package:note_pad/view/bottom_navbar.dart';
import 'package:note_pad/view/note_details_pages.dart';

const String bottomNavigationBar="/bottom-nav-bar";
const String noteDetailspage="/note-details-page";

List<GetPage> getpages=[
  GetPage(name: bottomNavigationBar, page: ()=> BottomNavBar()),
  GetPage(name: noteDetailspage, page: ()=> NoteDetailspage()),
];