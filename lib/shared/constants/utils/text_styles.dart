
import 'package:flutter/material.dart';
import 'colors.dart';
import 'fonts.dart';
class AppStyles {
  static TextStyle regular18 = AppFonts.ubuntuFont(
    TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 18,
    ),
  );
  static TextStyle regular20 = AppFonts.ubuntuFont(
    TextStyle(
      fontWeight: FontWeight.w500,
      color: AppColors.textBlackColor,
      fontSize: 20,
    ),);
  static TextStyle regular12 = AppFonts.ubuntuFont(
    TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 14,
    ),
  );
  static TextStyle regular24 = AppFonts.ubuntuFont(
     TextStyle(
      fontWeight: FontWeight.w600,
       color: Colors.white,
      fontSize: 32,
    ),
  );

  static TextStyle bold20 = AppFonts.ubuntuFont(
    TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 20,
    ),
  );

  static TextStyle italic16 = AppFonts.ubuntuFont(
    TextStyle(
      fontStyle: FontStyle.italic,
      color: Colors.white,
      fontSize: 16,
    ),
  );

}
