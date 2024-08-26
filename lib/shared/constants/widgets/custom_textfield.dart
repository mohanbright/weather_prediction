import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import '../utils/fonts.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Color labelColor;
  final double labelFontSize;
  final double hintFontSize;
  final double borderRadius;
  final double containerHeight;
  final Widget? suffix;
  final Widget? prefix;
  final double padding;
  final double shadowOpacity;
  final FontWeight labelFontWeight;
  final FontWeight hintFontWeight;
  final Color focusedBorderColor;
  final String? Function(String?)? validator;
  final VoidCallback? editingComplete;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final IconButton? suffixIcon;
  final IconButton? prefixIcon;
  final bool? obscureText;
  final TextStyle? style;
  final Function(String)? onTextChanged;
  final Function()? onTap;
  final TextInputType? keyBoardType;
  final TextInputFormatter? filteringTextInputFormatter;
  final bool readOnly;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onFieldSubmitted;


  const CustomTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.containerHeight = 59,
    this.labelColor = Colors.brown,
    this.labelFontSize = 15,
    this.hintFontSize = 18,
    this.padding = 20,
    this.suffix,
    this.prefix,
    this.borderRadius = 10,
    this.labelFontWeight = FontWeight.w300,
    this.hintFontWeight = FontWeight.w400,
    this.focusedBorderColor = Colors.brown,
    this.validator,
    this.editingComplete,
    this.controller,
    this.keyboardType,
    required this.textInputAction,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.onTextChanged,
    this.style,
    this.onTap,
    this.keyBoardType,
    this.shadowOpacity = 0.5,
    this.filteringTextInputFormatter,
    this.readOnly = false,
    this.inputFormatters,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: AppColors.textFieldColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(shadowOpacity),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: TextFormField(
          readOnly: readOnly,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator,
          onChanged: (value) {
            if (onTextChanged != null) {
              onTextChanged!(value);
            }
          },
          onTap: onTap,
          controller: controller,
          textInputAction: textInputAction,
          obscureText: obscureText ?? false,
          onEditingComplete: editingComplete,
          onFieldSubmitted: onFieldSubmitted,

          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            hintStyle: AppFonts.poppinsFont(
              TextStyle(
                  fontWeight: hintFontWeight,
                  color: AppColors.hintTextColor,
                  fontSize: hintFontSize),
            ),
            labelStyle: AppFonts.poppinsFont(
              TextStyle(
                fontWeight: labelFontWeight,
                color: labelColor,
                fontSize: labelFontSize,
              ),
            ),

            border: InputBorder.none,
            suffixIcon: suffix,
            prefixIcon: prefix,
          ),
          style: style,
        ).paddingOnly(left: padding),
      ),
    );
  }
}
