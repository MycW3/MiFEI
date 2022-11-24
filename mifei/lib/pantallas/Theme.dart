import 'package:flutter/material.dart';

class Colors {

  const Colors();


  static const Color appBarTitle = Color.fromARGB(255, 0, 0, 0);
  static const Color appBarIconColor = Color.fromARGB(255, 0, 0, 0);
  static const Color appBarDetailBackground = const Color(0x00FFFFFF);
  static const Color appBarGradientStart = const Color(0xFF3383FC);
  static const Color appBarGradientEnd = const Color(0xFF00C6FF);

  //static const Color planetCard = const Color(0xFF434273);
  static const Color planetCard = const Color(0xFF8685E5);
  //static const Color planetListBackground = const Color(0xFF3E3963);
  static const Color planetPageBackground = const Color(0xFF736AB7);
  static const Color planetTitle = Color.fromARGB(255, 0, 0, 0);
  static const Color planetLocation = const Color(0x66FFFFFF);
  static const Color planetDistance = Color.fromARGB(102, 0, 0, 0);

}

class Dimens {
  const Dimens();

  static const planetWidth = 100.0;
  static const planetHeight = 100.0;
}

class TextStyles {

  const TextStyles();

  static const TextStyle appBarTitle = const TextStyle(
    color: Colors.appBarTitle,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 36.0
  );

  static const TextStyle planetTitle = const TextStyle(
    color: Colors.planetTitle,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 24.0
  );

  static const TextStyle planetLocation = const TextStyle(
    color: Color.fromARGB(102, 0, 0, 0),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    fontSize: 14.0
  );

  static const TextStyle planetDistance = const TextStyle(
    color: Color.fromARGB(102, 0, 0, 0),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    fontSize: 12.0
  );


}