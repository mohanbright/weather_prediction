import 'package:flutter/material.dart';
import 'colors.dart';
import 'font_size.dart';
import 'fonts.dart';

class AppSnackBarToast {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      buildShowSnackBar(BuildContext context, title) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          title,
          style: AppFonts.poppinsFont(
            TextStyle(
                color: AppColors.textBlackColor,
                fontWeight: FontWeight.w600,
                fontSize: AppFontSize.font14),
          ),
        ),
        backgroundColor: AppColors.textBlackColor,
      ),
    );
  }
}
