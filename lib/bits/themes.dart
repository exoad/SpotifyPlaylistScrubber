import 'package:flutter/material.dart';

class LaF {
  static final BorderRadius themeBorderRadius =
      BorderRadius.circular(8);
  static const TextStyle emphasisText =
      TextStyle(fontWeight: FontWeight.w800, color: Colors.black);
  static const TextStyle normalText =
      TextStyle(fontWeight: FontWeight.w600, color: Colors.black);
  static const double ARTWORK_LISTVIEW_SIZE = 96;
  // ByakkoLaF
  static const Color primary1 = Color.fromARGB(255, 47, 184, 254);
  static const Color primary2 = Color.fromARGB(255, 250, 82, 134);
  static const Color bg = Colors.white;

  static ThemeData theme() => ThemeData(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          hoverElevation: 14,

          backgroundColor: LaF.bg,
          foregroundColor: LaF.primary1,
          shape: RoundedRectangleBorder(
              borderRadius: themeBorderRadius)));
}
