
import 'package:flutter/material.dart';
import 'package:note_pad/utils/all_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AllStyle{
  static final titleTextStyle = TextStyle(
    color: AllColors.whitecolor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 20.0,
    fontWeight: FontWeight.bold
  );
  static final notetitleTextstyle = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AllColors.bluecolor
  );
  static final notedescriptionTextstyle = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    color: AllColors.blackcolor
  );
  static final dateTextstyle = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    color: AllColors.graycolor
  );
  static final emptyTextstyle = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    color: AllColors.graycolor
  );
}