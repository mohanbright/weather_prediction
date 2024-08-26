import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'font_size.dart';

class AppFonts {
  static TextStyle poppinsFont(textStyle) {
    return GoogleFonts.poppins(textStyle: textStyle);
  }

  static TextStyle aliceFont(textStyle) {
    return GoogleFonts.alice(textStyle: textStyle);
  }

  static TextStyle ubuntuFont(textStyle) {
    return GoogleFonts.ubuntu(textStyle: textStyle);
  }
}

Widget buildTextSpan(firstText, secondText) {
  return Text.rich(
    TextSpan(
      text: '$firstText ',
      style: AppFonts.poppinsFont(TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.textBlackColor,
          fontSize: AppFontSize.font24)),
      children: <InlineSpan>[
        TextSpan(
          text: '$secondText',
          style: AppFonts.poppinsFont(TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.textBlackColor,
              fontSize: AppFontSize.font24)),
        ),
      ],
    ),
  );
}
