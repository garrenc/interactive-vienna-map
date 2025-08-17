import 'package:flutter/material.dart';

class ThemeService {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Montserrat',
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    bottomSheetTheme: BottomSheetThemeData(
      modalBarrierColor: Colors.transparent,
    ),
  );
}
