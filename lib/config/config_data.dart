import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      
    )
  );
}

TextStyle get mainTitleStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      
    )
  );
}

TextStyle get HeadingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    )
  );
}

TextStyle get hintStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 18,
      color: Colors.grey,
    )
  );
}
